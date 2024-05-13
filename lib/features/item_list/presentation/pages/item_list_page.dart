import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/features/item_list/item_list.dart';
import 'package:trackus/features/task/presentation/widgets/task_item.dart';
import 'package:trackus/lib.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({
    required this.title,
    required this.getItems,
    required this.getProjects,
    required this.insertItem,
    this.defaultProject, // TODO: use
    this.defaultDueDate,
    super.key,
  });

  final String title;
  final DateTime? defaultDueDate;
  final Project? defaultProject;
  final FutureOr<List<Item>> Function() getItems;
  final FutureOr<List<Project>> Function() getProjects;
  final Future<void> Function(Item) insertItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ItemListCubit(
        getItems: getItems,
        getProjects: getProjects,
        insertItem: insertItem,
      )..init(),
      child: _ItemListView(
        title: title,
        defaultDueDate: defaultDueDate,
      ),
    );
  }
}

class _ItemListView extends StatelessWidget {
  const _ItemListView({
    required this.title,
    required this.defaultDueDate,
  });

  final String title;
  final DateTime? defaultDueDate;

  void updateState(BuildContext context) {
    context.read<ItemListCubit>().init();
  }

  void addItem(BuildContext context, Item item) {
    context.read<ItemListCubit>().insertItem(item);
  }

  @override
  Widget build(BuildContext context) {
    final projects =
        context.select((ItemListCubit cubit) => cubit.state.projects);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: BlocBuilder<ItemListCubit, ItemListState>(
          builder: (context, state) {
            final items = state.items;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return TaskItem(
                  key: ValueKey(item.id),
                  item: item,
                  showIfDone: true,
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final currContext = context;
          if (context.mounted) {
            await showModalBottomSheet<void>(
              context: context,
              builder: (context) => ItemAdder(
                projects: projects,
                defaultDueDate: defaultDueDate,
                onAdd: (item) => addItem(currContext, item),
              ),
              shape: const BeveledRectangleBorder(),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
