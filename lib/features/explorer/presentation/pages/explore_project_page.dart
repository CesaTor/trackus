import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/features/item_list/item_list.dart';
import 'package:trackus/lib.dart';

class ExploreProjectPage extends StatelessWidget {
  const ExploreProjectPage({
    required this.projectId,
    super.key,
  });
  final int projectId;

  @override
  Widget build(BuildContext context) {
    final project = GetProjectById(context.read(), projectId).call();

    return FutureBuilder<Project?>(
      future: project,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final proj = snapshot.data ?? defaultProject;
        return ItemListPage(
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
                            await DeleteProject(context.read()).call(proj);
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
          getItems:
              GetItemsByProjectId(context.read(), projectId, includeDone: true)
                  .call,
          getProjects: GetAllProjects(context.read()).call,
          insertItem: InsertItem(context.read()).call,
        );
      },
    );
  }
}
