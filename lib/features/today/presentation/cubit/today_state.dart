import 'package:equatable/equatable.dart';
import 'package:trackus/lib.dart';

enum TodayStatus { initial, loading, loaded, error }

class TodayState extends Equatable {
  const TodayState(
    this.status, {
    required this.items,
    required this.projects,
    this.message,
  });

  TodayState.initial() : this(TodayStatus.initial, items: [], projects: []);

  TodayState loading() => copyWith(status: TodayStatus.loading);

  TodayState loaded(List<Item> items, List<Project> projects) => copyWith(
        status: TodayStatus.loaded,
        items: items,
        projects: projects,
      );

  TodayState error(String message) => copyWith(
        status: TodayStatus.error,
        message: message,
      );

  final TodayStatus status;
  final List<Item> items;
  final List<Project> projects;
  final String? message;

  TodayState copyWith({
    TodayStatus? status,
    List<Item>? items,
    List<Project>? projects,
    String? message,
  }) {
    return TodayState(
      status ?? this.status,
      items: items ?? this.items,
      projects: projects ?? this.projects,
      message: message,
    );
  }

  @override
  List<Object?> get props => [status, items, projects, message];
}
