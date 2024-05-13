import 'package:equatable/equatable.dart';
import 'package:trackus/lib.dart';

enum InboxStatus { initial, loading, loaded, error }

class InboxState extends Equatable {
  const InboxState(
    this.status, {
    required this.items,
    required this.projects,
    this.message,
  });

  InboxState.initial() : this(InboxStatus.initial, items: [], projects: []);

  InboxState loading() => copyWith(status: InboxStatus.loading);

  InboxState loaded(List<Item> items, List<Project> projects) => copyWith(
        status: InboxStatus.loaded,
        items: items,
        projects: projects,
      );

  InboxState error(String message) => copyWith(
        status: InboxStatus.error,
        message: message,
      );

  final InboxStatus status;
  final List<Item> items;
  final List<Project> projects;
  final String? message;

  InboxState copyWith({
    InboxStatus? status,
    List<Item>? items,
    List<Project>? projects,
    String? message,
  }) {
    return InboxState(
      status ?? this.status,
      items: items ?? this.items,
      projects: projects ?? this.projects,
      message: message,
    );
  }

  @override
  List<Object?> get props => [status, items, projects, message];
}
