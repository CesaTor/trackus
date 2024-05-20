import 'package:equatable/equatable.dart';
import 'package:trackus/app/models/models.dart';

enum ItemListStatus { initial, loading, loaded, error }

class ItemListState extends Equatable {
  const ItemListState(
    this.status, {
    required this.items,
    required this.projects,
    this.message,
  });

  ItemListState.initial()
      : this(ItemListStatus.initial, items: [], projects: []);

  ItemListState loading() => copyWith(status: ItemListStatus.loading);

  ItemListState loaded(List<Item> items, List<Project> projects) => copyWith(
        status: ItemListStatus.loaded,
        items: items,
        projects: projects,
      );

  ItemListState error(String message) => copyWith(
        status: ItemListStatus.error,
        message: message,
      );

  final ItemListStatus status;
  final List<Item> items;
  final List<Project> projects;
  final String? message;

  ItemListState copyWith({
    ItemListStatus? status,
    List<Item>? items,
    List<Project>? projects,
    String? message,
  }) {
    return ItemListState(
      status ?? this.status,
      items: items ?? this.items,
      projects: projects ?? this.projects,
      message: message,
    );
  }

  @override
  List<Object?> get props => [status, items, projects, message];
}
