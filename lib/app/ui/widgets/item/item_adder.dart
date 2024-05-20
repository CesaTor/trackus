import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:trackus/app/extensions/extensions.dart';
import 'package:trackus/app/i18n/i18n.dart';
import 'package:trackus/app/models/models.dart';

part 'item_adder_options.dart';

class ItemAdder extends StatefulWidget {
  const ItemAdder({
    required this.projects,
    required this.onAdd,
    this.initialProject,
    this.defaultDueDate,
    super.key,
  });

  Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) => this,
      shape: const BeveledRectangleBorder(),
    );
  }

  final DateTime? defaultDueDate;
  final Project? initialProject;
  final Iterable<Project> projects;
  final void Function(Item item) onAdd;

  @override
  State<ItemAdder> createState() => _ItemAdderState();
}

class _ItemAdderState extends State<ItemAdder> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Title(titleController),
        _Description(descriptionController),
        ItemAdderOptions(
          projects: widget.projects,
          initialProject: widget.initialProject,
          dafaultDueDate: widget.defaultDueDate,
          onSave: (project, dueDate, priority) {
            final item = Item(
              title: titleController.text,
              isDone: false,
              priority: priority,
              description: descriptionController.text,
              dueDate: dueDate,
              project: project,
            );

            widget.onAdd(item);
            Navigator.of(context).pop(item);
          },
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.controller);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          hintText: i18n.core.form.title,
          hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          border: InputBorder.none,
        ),
        textInputAction: TextInputAction.newline,
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description(this.controller);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: controller,
          maxLines: 5,
          minLines: 1,
          decoration: InputDecoration(
            hintText: i18n.core.form.description,
            hintStyle: const TextStyle(fontSize: 13),
            border: InputBorder.none,
          ),
        ),
      );
}
