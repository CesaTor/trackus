import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:trackus/app/models/models.dart';
import 'package:trackus/features/item_list/presentation/cubit/cubit.dart';

class ItemListCubit extends Cubit<ItemListState> {
  ItemListCubit({
    required FutureOr<List<Item>> Function() getItems,
    required FutureOr<List<Project>> Function() getProjects,
    required Future<void> Function(Item) insertItem,
  })  : _getItems = getItems,
        _getProjects = getProjects,
        _insertItem = insertItem,
        super(ItemListState.initial());

  final FutureOr<List<Item>> Function() _getItems;
  final FutureOr<List<Project>> Function() _getProjects;
  final Future<void> Function(Item) _insertItem;

  Future<void> init() async {
    emit(state.loading());
    final data = await _update();
    emit(state.loaded(data.$1, data.$2));
  }

  Future<(List<Item> items, List<Project> projects)> _update() async {
    return (await _getItems(), await _getProjects());
  }

  Future<void> insertItem(Item item) async {
    emit(state.loading());
    await _insertItem(item);
    final data = await _update();
    emit(state.loaded(data.$1, data.$2));
  }
}
