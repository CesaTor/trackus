import 'package:bloc/bloc.dart';
import 'package:trackus/features/today/domain/usecases/get_today_items.dart';
import 'package:trackus/features/today/presentation/cubit/today_state.dart';
import 'package:trackus/lib.dart';

class TodayCubit extends Cubit<TodayState> {
  TodayCubit({
    required this.getTodayItems,
    required this.getAllProjects,
  }) : super(TodayState.initial());

  final GetTodayItems getTodayItems;
  final GetAllProjects getAllProjects;

  Future<void> init() async {
    emit(state.loading());
    final items = await getTodayItems();
    final projects = await getAllProjects();
    emit(state.loaded(items, projects));
  }
}
