import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:trackus/app/extensions/extensions.dart';
import 'package:trackus/app/i18n/i18n.dart';
import 'package:trackus/app/models/models.dart';

part 'item_adder_options.dart';

class ItemEditor extends StatefulWidget {
  const ItemEditor({
    required this.projects,
    required this.initialItem,
    super.key,
  });

  Future<Item?> show(BuildContext context) {
    return showModalBottomSheet<Item>(
      context: context,
      builder: (context) => this,
      shape: const BeveledRectangleBorder(),
    );
  }

  final Iterable<Project> projects;
  final Item initialItem;

  @override
  State<ItemEditor> createState() => _ItemEditorState();
}

class _ItemEditorState extends State<ItemEditor> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final Item item;

  @override
  void initState() {
    item = widget.initialItem;
    titleController = TextEditingController(text: item.title);
    descriptionController = TextEditingController(text: item.description);
    super.initState();
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
          initialProject: item.project.value,
          dafaultDueDate: item.dueDate,
          onSave: (project, dueDate, priority) {
            final newItem = item.copyWith(
              title: titleController.text,
              isDone: false,
              priority: priority,
              description: descriptionController.text,
              dueDate: dueDate,
              project: project,
            );

            Navigator.of(context).pop(newItem);
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
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
