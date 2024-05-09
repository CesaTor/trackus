import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'inbox_event.dart';
part 'inbox_state.dart';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  InboxBloc() : super(InboxInitial()) {
    on<InboxEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
