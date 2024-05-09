part of 'inbox_bloc.dart';

abstract class InboxState extends Equatable {
  const InboxState();  

  @override
  List<Object> get props => [];
}
class InboxInitial extends InboxState {}
