import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:trackus/_shared/_shared.dart';
import 'package:trackus/features/task/task.dart';
import 'package:trackus/features/task_list/item_list.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({
    required this.title,
    required this.project,
    required this.defaultDueDate,
    required this.viewModel,
    this.actions,
    super.key,
  });

  final String title;
  final Project? project;
  final DateTime? defaultDueDate;
  final List<Widget>? actions;

  final TaskListViewModel viewModel;

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  void initState() {
    widget.viewModel.init();
    super.initState();
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: widget.project?.colorValue.color),
        ),
        actions: widget.actions,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Watch(
          (context) {
            final items = widget.viewModel.tasks;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final task = items[index];
                return TaskItem(
                  task: task,
                  showIfDone: true,
                  toggle: (value) {
                    widget.viewModel.markTaskAsCompleted(
                      task,
                      completed: value,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.project?.colorValue.color,
        onPressed: () async {
          final task = await TaskEditor(
            projects: widget.viewModel.projects,
            initialTask: Task.empty().copyWith(
              project: widget.project,
              dueDate: widget.defaultDueDate,
            ),
          ).show(context);

          if (task != null && context.mounted) {
            widget.viewModel.addTask(task);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
