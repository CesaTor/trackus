import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/features/task/task.dart';
import 'package:trackus/lib.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.item,
    this.showIfDone = false,
    super.key,
  });
  final Item item;
  final bool showIfDone;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TaskRepository(context.read()),
      child: BlocProvider(
        create: (context) => TaskCubit(
          item: item,
          toggle: ToggleIsDone(context.read(), item),
          watchItem: WatchItem(context.read(), item),
        )..init(),
        child: _TaskItem(showIfDone: showIfDone),
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem({this.showIfDone = false});

  final bool showIfDone;

  @override
  Widget build(BuildContext context) {
    final item = context.select((TaskCubit value) => value.state);

    final textStyle = item.isDone
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : null;

    final description = item.description != null
        ? Text(
            item.description!,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
            maxLines: 1,
          )
        : null;

    return Visibility(
      visible: !(item.isDone && !showIfDone),
      child: Card(
        child: ListTile(
          leading: Checkbox(
            side: BorderSide(color: item.priority.color),
            value: item.isDone,
            activeColor: Colors.grey,
            onChanged: (_) => context.read<TaskCubit>().toggle(),
          ),
          title: Text(item.title, style: textStyle),
          subtitle: description,
        ),
      ),
    );
  }
}