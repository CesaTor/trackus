import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:trackus/_shared/_shared.dart';
import 'package:trackus/features/search/presentation/pages/search_viewmodel.dart';
import 'package:trackus/features/task/presentation/widgets/task_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    required this.viewModel,
    super.key,
  });

  final SearchViewModel viewModel;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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

  @override
  Widget build(BuildContext context) {
    final tasks = widget.viewModel.tasks.watch(context);
    final projects = widget.viewModel.projects.watch(context);

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
                  onChange: widget.viewModel.search,
                  controller: controller,
                ),
              ),
            ),
            ...[
              if (tasks.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('${i18n.search.items}:'),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final task = tasks[index];
                      return TaskItem(
                        key: ValueKey(task.id),
                        task: task,
                        showIfDone: true,
                        toggle: (value) {
                          widget.viewModel
                              .markTaskAsCompleted(task, completed: value);
                        },
                      );
                    },
                    childCount: tasks.length,
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
