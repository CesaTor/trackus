import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/app/extensions/extensions.dart';
import 'package:trackus/app/models/models.dart';
import 'package:trackus/app/ui/ui.dart';
import 'package:trackus/features/item_list/item_list.dart';
import 'package:trackus/features/task/presentation/widgets/task_item.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({
    required this.title,
    required this.getItems,
    required this.watchItems,
    required this.getProjects,
    required this.insertItem,
    this.project,
    this.dueDate,
    this.actions,
    super.key,
  });

  final String title;
  final DateTime? dueDate;
  final Project? project;
  final FutureOr<List<Item>> Function() getItems;
  final Stream<List<Item>> Function() watchItems;

  final FutureOr<List<Project>> Function() getProjects;
  final Future<void> Function(Item) insertItem;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ItemListCubit(
        getItems: getItems,
        getProjects: getProjects,
        watchItems: watchItems,
        insertItem: insertItem,
      )..init(),
      child: _ItemListView(
        title: title,
        project: project,
        defaultDueDate: dueDate,
        actions: actions,
      ),
    );
  }
}

class _ItemListView extends StatelessWidget {
  const _ItemListView({
    required this.title,
    required this.project,
    required this.defaultDueDate,
    this.actions,
  });

  final String title;
  final Project? project;
  final DateTime? defaultDueDate;
  final List<Widget>? actions;

  void addItem(BuildContext context, Item item) {
    context.read<ItemListCubit>().insertItem(item);
  }

  @override
  Widget build(BuildContext context) {
    final projects =
        context.select((ItemListCubit cubit) => cubit.state.projects);

    final items = context.select((ItemListCubit cubit) => cubit.state.items);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: project?.colorValue.color),
        ),
        actions: actions,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return TaskItem(
              item: item,
              showIfDone: true,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: project?.colorValue.color,
        onPressed: () async {
          final item = await ItemEditor(
            projects: projects,
            initialItem: Item.empty().copyWith(
              project: project,
              dueDate: defaultDueDate,
            ),
          ).show(context);

          if (item != null && context.mounted) {
            addItem(context, item);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
