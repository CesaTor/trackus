import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';
import 'package:trackus/_shared/_shared.dart';
import 'package:trackus/features/explorer/presentation/explore_project_viewmodel.dart';
import 'package:trackus/features/task_list/item_list.dart';

class ExploreProjectPage extends StatefulWidget {
  const ExploreProjectPage({
    required this.projectId,
    required this.viewModel,
    super.key,
  });
  final int projectId;
  final ExploreProjectViewModel viewModel;

  @override
  State<ExploreProjectPage> createState() => _ExploreProjectPageState();
}

class _ExploreProjectPageState extends State<ExploreProjectPage> {
  @override
  void initState() {
    widget.viewModel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final proj = widget.viewModel.project.watch(context);

    if (proj == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return TaskListView(
      viewModel: TaskListViewModel(
        addTask: AddTask(taskRepo),
        updateTask: UpdateTask(taskRepo),
        deleteTask: DeleteTask(taskRepo),
        getTasks: GetTasksByProjectId(taskRepo, id: widget.projectId),
        getProjects: GetProjects(projectRepo),
      ),
      defaultDueDate: null,
      title: proj.name,
      actions: [
        // Remove project button
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            // show delete dialog
            final res = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(i18n.explorer.modal.delete.project.title),
                content: Text(
                  i18n.explorer.modal.delete.project
                      .content(ProjectName: proj.name),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      // it won't close with context.pop()
                      Navigator.of(context).pop(false);
                    },
                    child: Text(i18n.core.cancel),
                  ),
                  TextButton(
                    onPressed: () async {
                      try {
                        widget.viewModel.deleteProject(proj);
                        if (context.mounted) {
                          Navigator.of(context).pop(true);
                        }
                      } catch (e) {
                        if (context.mounted) {
                          Navigator.of(context).pop(false);
                        }
                      }
                    },
                    child: Text(i18n.core.delete),
                  ),
                ],
              ),
            );
            if (res != null && res) {
              if (context.mounted) context.pop();
            }
          },
        ),
      ],
      project: proj,
    );
  }
}
