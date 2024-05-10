import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/features/task/task.dart';
import 'package:trackus/lib.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.item,
    super.key,
  });
  final Item item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(
        item: item,
        updateItem: UpdateItem(context.read()),
        watchItem: WatchItem(context.read()),
      ),
      child: const _TaskItem(),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem();

  @override
  Widget build(BuildContext context) {
    final item = context.select((TaskCubit value) => value.state);

    return Card(
      child: ListTile(
        leading: Checkbox(
          value: item.isDone,
          onChanged: (value) {
            context.read<TaskCubit>().toggle(isDone: value);
          },
        ),
        title: Text(item.title),
        subtitle: item.description != null
            ? Text(
                item.description!,
                overflow: TextOverflow.ellipsis,
              )
            : null,
      ),
    );
  }
}
