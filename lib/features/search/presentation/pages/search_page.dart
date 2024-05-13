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

class _SearchView extends StatelessWidget {
  void _search(BuildContext context, String query) {
    context.read<SearchBloc>().add(SearchQueryChanged(query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: _SearchInput(onChange: (query) => _search(context, query)),
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          final items = state.items;
          final projects = state.projects;

          switch (state.status) {
            case SearchStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case SearchStatus.error:
            case SearchStatus.initial:
            case SearchStatus.loaded:
              return CustomScrollView(
                slivers: [
                  if (items.isNotEmpty) ...[
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Items:'),
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
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Projects:'),
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
              );
          }
        },
      ),
    );
  }
}

class _SearchInput extends StatefulWidget {
  const _SearchInput({required this.onChange});

  final void Function(String query) onChange;

  @override
  State<_SearchInput> createState() => __SearchInputState();
}

class __SearchInputState extends State<_SearchInput> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(() => widget.onChange(controller.text));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicWidth(
        child: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Query',
            hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            border: InputBorder.none,
          ),
          textInputAction: TextInputAction.newline,
        ),
      ),
    );
  }
}
