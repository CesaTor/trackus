import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trackus/core/extensions/extensions.dart';
import 'package:trackus/features/explorer/explorer.dart';
import 'package:trackus/lib.dart';

class ExplorerAddPage extends StatefulWidget {
  const ExplorerAddPage({
    super.key,
  });

  @override
  State<ExplorerAddPage> createState() => _ExplorerAddPageState();
}

class _ExplorerAddPageState extends State<ExplorerAddPage> {
  late Color pickedColor = defaultProject.colorValue.color;
  late String projectName = '';
  late bool isFavorite = false;
  late Layout layout = Layout.list;
  Project? parentProject;
  List<Project> projects = [];

  @override
  void initState() {
    GetAllProjects(context.read())
        .call()
        .then((value) => setState(() => projects.addAll(value)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // hide keyboard
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add new project'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final project = Project(
                  name: projectName,
                  colorValue: pickedColor.value,
                  isFavorite: isFavorite,
                  layout: layout,
                  parent: parentProject,
                );
                context.pop(project);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 16),
              _ProjectName(
                color: pickedColor,
                onNameChange: (value) => setState(() => projectName = value),
                onColorChange: (value) => setState(() => pickedColor = value),
              ),
              const SizedBox(height: 16),
              // Favorite
              _IconRow(
                icon: Icons.star_outline,
                child: SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  value: isFavorite,
                  onChanged: (value) => setState(() => isFavorite = value),
                  title: const Text('Favorite'),
                ),
              ),
              const SizedBox(height: 8),
              // Layout
              _IconRow(
                icon: Icons.remove_red_eye,
                child: DropdownButtonFormField<Layout>(
                  decoration: InputDecoration(
                    labelText: 'Layout',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(borderRadius: roundedBorder),
                  ),
                  value: layout,
                  onChanged: (value) => setState(() => layout = value!),
                  items: Layout.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Row(
                            children: [
                              Icon(e.icon),
                              const SizedBox(width: 8),
                              Text(e.name),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 24),
              // Parent picker
              _IconRow(
                icon: Icons.menu,
                child: DropdownButtonFormField<Project?>(
                  decoration: InputDecoration(
                    labelText: 'Parent project',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(borderRadius: roundedBorder),
                  ),
                  value: parentProject,
                  onChanged: (value) => setState(() => parentProject = value),
                  items: [
                    const DropdownMenuItem(child: Text('No parent project')),
                    ...projects.map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Row(
                          children: [
                            Icon(e.icon),
                            const SizedBox(width: 8),
                            Text(e.name),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconRow extends StatelessWidget {
  const _IconRow({
    required this.icon,
    required this.child,
  });

  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const SizedBox(width: 8),
          Icon(icon),
          const SizedBox(width: 16),
          Expanded(child: child),
        ],
      );
}

class _ProjectName extends StatelessWidget {
  const _ProjectName({
    required this.color,
    required this.onNameChange,
    required this.onColorChange,
  });

  final Color color;
  final void Function(String value) onNameChange;
  final void Function(Color value) onColorChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            ColorPicker.show(context, selectedColor: color)
                .then((val) => onColorChange(val ?? color));
          },
          icon: Icon(Icons.tag, color: color),
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: TextField(
              onChanged: onNameChange,
              decoration: InputDecoration(
                labelText: 'Parent Name',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(borderRadius: roundedBorder),
              ),
              autofocus: true,
            ),
          ),
        ),
      ],
    );
  }
}
