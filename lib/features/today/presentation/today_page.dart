import 'package:flutter/material.dart';
import 'package:trackus/_shared/_shared.dart';
import 'package:trackus/features/task_list/item_list.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskListView(
      defaultDueDate: today,
      viewModel: TaskListViewModel(
        addTask: AddTask(taskRepo),
        deleteTask: DeleteTask(taskRepo),
        getProjects: GetProjects(projectRepo),
        getTasks: GetTasks(taskRepo),
        updateTask: UpdateTask(taskRepo),
      ),
      title: i18n.core.today,
      project: defaultProject,
    );
  }
}
