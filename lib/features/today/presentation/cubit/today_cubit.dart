import 'package:bloc/bloc.dart';
import 'package:trackus/features/today/presentation/cubit/today_state.dart';

class TodayCubit extends Cubit<TodayState> {
  TodayCubit() : super(TodayInitial());
}
