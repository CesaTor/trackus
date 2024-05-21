import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';
import 'package:trackus/_shared/_shared.dart';
import 'package:trackus/features/explorer/explorer.dart';

class ExplorerAddPage extends StatefulWidget {
  const ExplorerAddPage({
    required this.viewmodel,
    super.key,
  });

  final ExploreAddTaskViewModel viewmodel;

  @override
  State<ExplorerAddPage> createState() => _ExplorerAddPageState();
}

class _ExplorerAddPageState extends State<ExplorerAddPage> {
  @override
  void initState() {
    widget.viewmodel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.viewmodel;
    final projects = s.projects.watch(context);
    final pickedColor = s.pickedColor.watch(context);
    final isFavorite = s.isFavorite.watch(context);
    final layout = s.layout.watch(context);
    final parentProject = s.parentProject.watch(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // hide keyboard
      child: Scaffold(
        appBar: AppBar(
          title: Text(i18n.explorer.add.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () => context.pop(widget.viewmodel.project),
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
                onNameChange: (value) => s.projectName.value = value,
                onColorChange: (value) => s.pickedColor.value = value,
              ),
              const SizedBox(height: 16),
              // Favorite
              _IconRow(
                icon: Icons.star_outline,
                child: SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  value: isFavorite,
                  onChanged: (value) => s.isFavorite.value = value,
                  title: Text(i18n.explorer.add.favorite),
                ),
              ),
              const SizedBox(height: 8),
              // Layout
              _IconRow(
                icon: Icons.remove_red_eye,
                child: DropdownButtonFormField<Layout>(
                  decoration: InputDecoration(
                    labelText: i18n.explorer.add.layout,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(borderRadius: roundedBorder),
                  ),
                  value: layout,
                  onChanged: (value) =>
                      value != null ? s.layout.value = value : null,
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
              if (projects.isNotEmpty)
                _IconRow(
                  icon: Icons.menu,
                  child: DropdownButtonFormField<Project?>(
                    decoration: InputDecoration(
                      labelText: i18n.explorer.add.parent,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(borderRadius: roundedBorder),
                    ),
                    value: parentProject,
                    onChanged: (value) => s.parentProject.value = value,
                    items: [
                      DropdownMenuItem(child: Text(i18n.explorer.add.noParent)),
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
              const SizedBox(height: 50),
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
                labelText: i18n.explorer.add.parentName,
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
