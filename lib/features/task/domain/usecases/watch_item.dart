import 'package:trackus/lib.dart';

class WatchItem {
  WatchItem(this._repository);

  final ItemRepository _repository;

  Stream<Item>? call(int id) {
    try {
      final streams = _repository.watchItems(id);
      return streams.map((event) => event.first);
    } on Exception catch (_) {
      return null;
    }
  }
}
