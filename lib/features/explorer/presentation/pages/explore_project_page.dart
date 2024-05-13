import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          defaultProject: proj,
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
