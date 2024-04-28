import 'package:bloc/bloc.dart';

part 'item_list_state.dart';

class ItemListCubit extends Cubit<ItemListState> {
  ItemListCubit() : super(ItemListInitial());
}
