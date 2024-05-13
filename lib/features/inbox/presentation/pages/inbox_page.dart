import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/features/task/presentation/widgets/task_item.dart';
import 'package:trackus/lib.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InboxCubit(
        getItems: GetInboxItems(context.read()),
        getAllProjects: GetAllProjects(context.read()),
        insertItem: InsertItem(context.read()),
      )..init(),
      child: _InboxView(),
    );
  }
}

class _InboxView extends StatelessWidget {
  void updateState(BuildContext context) {
    context.read<InboxCubit>().init();
  }

  void addItem(BuildContext context, Item item) {
    context.read<InboxCubit>().insertItem(item);
  }

  @override
  Widget build(BuildContext context) {
    final projects = context.select((InboxCubit cubit) => cubit.state.projects);

    return Scaffold(
      appBar: AppBar(title: const Text('Inbox')),
      body: BlocBuilder<InboxCubit, InboxState>(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final currContext = context;
          if (context.mounted) {
            await showModalBottomSheet<void>(
              context: context,
              builder: (context) => ItemAdder(
                projects: projects,
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
