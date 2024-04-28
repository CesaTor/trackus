import 'package:bloc/bloc.dart';
import 'package:trackus/core/feature/domain/domain.dart';
import 'package:trackus/core/models/item/item.dart';

class ItemsCubit extends Cubit<List<Item>> {
  ItemsCubit({
    required GetAllItems getAllItems,
    required InsertItem insertItem,
    required ClearItems clearItems,
  })  : _getAllItems = getAllItems,
        _insertItem = insertItem,
        _clearItems = clearItems,
        super([]);

  final GetAllItems _getAllItems;
  final InsertItem _insertItem;
  final ClearItems _clearItems;

  Future<void> init() async {
    emit(await _getAllItems.call());
  }

  Future<void> addItem(Item item) async {
    await _insertItem.call(item);

    emit(await _getAllItems.call());
  }

  Future<void> clearItems() async {
    await _clearItems.call();
    emit(await _getAllItems.call());
  }
}
