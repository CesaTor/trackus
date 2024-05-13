import 'package:trackus/lib.dart';

class Search {
  Search(this.repository);

  final ItemRepository repository;

  Future<({List<Item> items, List<Project> projects})> call(
    String query,
  ) async {
    final items = repository.getItemsByQuery(query);
    final projects = repository.getProjectsByQuery(query);
    final res = await Future.wait([items, projects]);

    return (items: res[0] as List<Item>, projects: res[1] as List<Project>);
  }
}
