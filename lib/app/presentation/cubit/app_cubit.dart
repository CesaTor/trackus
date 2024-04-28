import 'dart:async';

import 'package:bloc/bloc.dart';
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
  })  : _getAllItems = getAllItems,
        _insertItem = insertItem,
        _clearItems = clearItems,
        _deleteItemById = deleteItemById,
        super(AppState(items: [], running: null));

  final GetAllItems _getAllItems;
  final InsertItem _insertItem;
  final ClearItems _clearItems;
  final DeleteItemById _deleteItemById;

  Future<void> init() async {
    emit(AppState(items: await _getAllItems(), running: null));
  }

  Future<void> addItem(Item item) async {
    await _insertItem(item);
    emit(state.copyWith(items: await _getAllItems()));
  }

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

  Entry? stop() {
    final entry = state.running?..set(end: DateTime.now());

    emit(AppState(items: state.items, running: null));
    return entry;
  }
}
