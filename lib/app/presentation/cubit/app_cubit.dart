import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:trackus/app/domain/usecases/insert_entry.dart';
import 'package:trackus/lib.dart';

class AppState {
  AppState({required this.items, required this.running});

  final List<Item> items;
  final Entry? running;

  AppState copyWith({List<Item>? items, Entry? running}) {
    return AppState(
      items: items ?? this.items,
      running: running ?? this.running,
    );
  }

  @override
  String toString() =>
      'AppState(${items.length}, ${running?.item.value?.name})';
}

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required GetAllItems getAllItems,
    required InsertItem insertItem,
    required ClearItems clearItems,
    required DeleteItemById deleteItemById,
    required InsertEntry insertEntry,
  })  : _getAllItems = getAllItems,
        _insertItem = insertItem,
        _clearItems = clearItems,
        _deleteItemById = deleteItemById,
        _insertEntry = insertEntry,
        super(AppState(items: [], running: null));

  final GetAllItems _getAllItems;
  final InsertItem _insertItem;
  final ClearItems _clearItems;
  final DeleteItemById _deleteItemById;
  final InsertEntry _insertEntry;

  Future<void> init() async {
    emit(AppState(items: await _getAllItems(), running: null));
  }

  Future<void> addItem(Item item) async {
    await _insertItem(item);
    emit(state.copyWith(items: await _getAllItems()));
  }

  Future<void> addEntry(Entry entry) => _insertEntry(entry);

  Future<void> removeItem(int id) async {
    await _deleteItemById(id);
    emit(state.copyWith(items: await _getAllItems()));
  }

  Future<void> clearItems() async {
    await _clearItems();
    emit(state.copyWith(items: await _getAllItems()));
  }

  void start(Item item) {
    final e = Entry()
      ..start = DateTime.now()
      ..item.value = item;

    emit(state.copyWith(running: e));
  }

  Future<Entry?> stop() async {
    final entry = state.running?..set(end: DateTime.now());

    emit(AppState(items: state.items, running: null));

    if (entry != null) await _insertEntry(entry);

    return entry;
  }
}
