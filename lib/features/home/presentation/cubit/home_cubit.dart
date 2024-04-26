import 'package:bloc/bloc.dart';
import 'package:trackus/core/models/item/item.dart';
import 'package:trackus/features/home/domain/domain.dart';
import 'package:trackus/features/home/domain/usecases/usecases.dart';

class HomeCubit extends Cubit<List<Item>> {
  HomeCubit({
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

    emit(List.from(state)..add(item));
  }

  Future<void> clearItems() async {
    await _clearItems.call();
    emit(await _getAllItems.call());
  }
}
