import 'package:flutter/material.dart';
import 'package:trackus/lib.dart';

part 'item_adder_options.dart';

class ItemAdder extends StatefulWidget {
  const ItemAdder({
    required this.projects,
    super.key,
  });

  final Iterable<Project> projects;

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
          onSave: (project) {
            print('Title: ${titleController.text}');
            print('Description: ${descriptionController.text}');
            print('Project: ${project.name}');
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
        decoration: const InputDecoration(
          hintText: 'Title',
          hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
          decoration: const InputDecoration(
            hintText: 'Description',
            hintStyle: TextStyle(fontSize: 13),
            border: InputBorder.none,
          ),
        ),
      );
}
