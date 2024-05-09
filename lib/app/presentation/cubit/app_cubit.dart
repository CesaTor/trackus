import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:trackus/lib.dart';

class AppState {
  AppState({required this.items});

  final List<Item> items;

  AppState copyWith({List<Item>? items}) {
    return AppState(items: items ?? this.items);
  }

  @override
  String toString() => 'AppState(${items.length})';
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
        super(AppState(items: []));

  final GetAllItems _getAllItems;
  final InsertItem _insertItem;
  final ClearItems _clearItems;
  final DeleteItemById _deleteItemById;

  Future<void> init() async {
    emit(AppState(items: await _getAllItems()));
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
}
