import 'package:bloc/bloc.dart';
import 'package:trackus/lib.dart';

class TodayCubit extends Cubit<TodayState> {
  TodayCubit({
    required GetTodayItems getTodayItems,
    required GetAllProjects getAllProjects,
    required InsertTodayItem insertTodayItem,
  })  : _getTodayItems = getTodayItems,
        _getAllProjects = getAllProjects,
        _insertTodayItem = insertTodayItem,
        super(TodayState.initial());

  final GetTodayItems _getTodayItems;
  final GetAllProjects _getAllProjects;
  final InsertTodayItem _insertTodayItem;

  Future<void> init() async {
    emit(state.loading());
    final data = await _update();
    emit(state.loaded(data.$1, data.$2));
  }

  Future<(List<Item> items, List<Project> projects)> _update() async {
    return (await _getTodayItems(), await _getAllProjects());
  }

  Future<void> insertTodayItem(Item item) async {
    await _insertTodayItem(item);
    final data = await _update();
    emit(state.loaded(data.$1, data.$2));
  }
}
