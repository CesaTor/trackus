import 'package:bloc/bloc.dart';
import 'package:trackus/lib.dart';

class InboxCubit extends Cubit<InboxState> {
  InboxCubit({
    required GetInboxItems getItems,
    required GetAllProjects getAllProjects,
    required InsertItem insertItem,
  })  : _getItems = getItems,
        _getAllProjects = getAllProjects,
        _insertItem = insertItem,
        super(InboxState.initial());

  final GetInboxItems _getItems;
  final GetAllProjects _getAllProjects;
  final InsertItem _insertItem;

  Future<void> init() async {
    emit(state.loading());
    final data = await _update();
    emit(state.loaded(data.$1, data.$2));
  }

  Future<(List<Item> items, List<Project> projects)> _update() async {
    return (await _getItems(), await _getAllProjects());
  }

  Future<void> insertItem(Item item) async {
    await _insertItem(item);
    final data = await _update();
    emit(state.loaded(data.$1, data.$2));
  }
}
