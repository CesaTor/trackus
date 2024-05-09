import 'package:trackus/lib.dart';

class AddItem {
  AddItem(this._itemRepository);

  final ItemRepository _itemRepository;

  Future<bool> call(Item item) async {
    try {
      await _itemRepository.insertItem(item);
      return true;
    } catch (e) {
      return false;
    }
  }
}
