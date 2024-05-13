import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/lib.dart';

class ExplorerAddPage extends StatelessWidget {
  const ExplorerAddPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final projects = GetAllProjects(context.read()).call();

    final Project project = Project(
        name: 'Name',
        colorValue: 12,
        id: null,
        isFavorite: false,
        layout: Layout.list,
        parent: null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new project'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Project name'),
            ),
          ],
        ),
      ),
    );
  }
}
