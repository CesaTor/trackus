import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/features/search/domain/usecases/search.dart';
import 'package:trackus/features/search/presentation/bloc/search_bloc.dart';
import 'package:trackus/features/task/presentation/widgets/task_item.dart';
import 'package:trackus/lib.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => SearchBloc(search: Search(context.read())),
        child: _SearchView(),
      );
}

class _SearchView extends StatefulWidget {
  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _search(BuildContext context, String query) {
    context.read<SearchBloc>().add(SearchQueryChanged(query));
  }

  @override
  Widget build(BuildContext context) {
    final items = context.select((SearchBloc bloc) => bloc.state.items);
    final projects = context.select((SearchBloc bloc) => bloc.state.projects);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // hide keyboard
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(i18n.search.title),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: _SearchInput(
                  onChange: (query) => _search(context, query),
                  controller: controller,
                ),
              ),
            ),
            ...[
              if (items.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('${i18n.search.items}:'),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = items[index];
                      return TaskItem(
                        key: ValueKey(item.id),
                        item: item,
                        showIfDone: true,
                      );
                    },
                    childCount: items.length,
                  ),
                ),
              ],
              if (projects.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('${i18n.search.projects}:'),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final project = projects[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(project.icon),
                          title: Text(project.name),
                        ),
                      );
                    },
                    childCount: projects.length,
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

class _SearchInput extends StatefulWidget {
  const _SearchInput({
    required this.onChange,
    required this.controller,
  });

  final void Function(String query) onChange;
  final TextEditingController? controller;

  @override
  State<_SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<_SearchInput> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    controller.addListener(() => widget.onChange(controller.text));
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller == null) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicWidth(
        child: TextField(
          controller: widget.controller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: i18n.search.hint,
            hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            border: InputBorder.none,
          ),
          textInputAction: TextInputAction.newline,
        ),
      ),
    );
  }
}
