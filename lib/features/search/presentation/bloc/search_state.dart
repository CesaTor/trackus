part of 'search_bloc.dart';

enum SearchStatus { initial, loading, loaded, error }

class SearchState extends Equatable {
  const SearchState({
    required this.status,
    required this.items,
    required this.projects,
    this.message,
  });

  factory SearchState.initial() {
    return const SearchState(
      status: SearchStatus.initial,
      items: [],
      projects: [],
    );
  }

  SearchState copyWith({
    SearchStatus? status,
    List<Item>? items,
    List<Project>? projects,
    String? query,
    String? message,
  }) {
    return SearchState(
      status: status ?? this.status,
      items: items ?? this.items,
      projects: projects ?? this.projects,
      message: message,
    );
  }

  final SearchStatus status;
  final List<Item> items;
  final List<Project> projects;
  final String? message;

  @override
  List<Object?> get props => [status, items, projects, message];
}
