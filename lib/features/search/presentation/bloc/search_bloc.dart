import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trackus/features/search/domain/usecases/search.dart';
import 'package:trackus/lib.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required Search search,
  })  : _search = search,
        super(SearchState.initial()) {
    on<SearchEvent>(
      (event, emit) async => switch (event) {
        SearchQueryChanged() => _runSearch(emit, event.query),
      },
    );
  }

  final Search _search;

  Future<void> _runSearch(Emitter<SearchState> emit, String query) async {
    if (query.isEmpty) {
      return emit(
        const SearchState(status: SearchStatus.loaded, items: [], projects: []),
      );
    }

    try {
      emit(state.copyWith(status: SearchStatus.loading));

      final res = await _search(query);

      emit(
        SearchState(
          status: SearchStatus.loaded,
          items: res.items,
          projects: res.projects,
        ),
      );
    } on Exception catch (e) {
      emit(state.copyWith(status: SearchStatus.error, message: e.toString()));
      rethrow;
    }
  }
}
