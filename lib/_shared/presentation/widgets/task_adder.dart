import 'package:flutter/material.dart';
import 'package:trackus/_shared/_shared.dart';

class TaskEditor extends StatefulWidget {
  const TaskEditor({
    required this.projects,
    required this.initialTask,
    super.key,
  });

  Future<Task?> show(BuildContext context) {
    return showModalBottomSheet<Task>(
      context: context,
      builder: (context) => this,
      shape: const BeveledRectangleBorder(),
    );
  }

  final Iterable<Project> projects;
  final Task initialTask;

  @override
  State<TaskEditor> createState() => _TaskEditorState();
}

class _TaskEditorState extends State<TaskEditor> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final Task task;

  @override
  void initState() {
    task = widget.initialTask;
    titleController = TextEditingController(text: task.title);
    descriptionController = TextEditingController(text: task.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Title(titleController),
        _Description(descriptionController),
        TaskAdderOptions(
          projects: widget.projects,
          initialProject: task.project.value,
          dafaultDueDate: task.dueDate,
          onSave: (project, dueDate, priority) {
            final newTask = task.copyWith(
              title: titleController.text,
              isDone: false,
              priority: priority,
              description: descriptionController.text,
              dueDate: dueDate,
              project: project,
            );

            Navigator.of(context).pop(newTask);
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
