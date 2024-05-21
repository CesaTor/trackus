import 'package:flutter/material.dart';
import 'package:trackus/_shared/_shared.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.task,
    required this.toggle,
    this.showIfDone = false,
    super.key,
  });
  final Task task;
  final bool showIfDone;
  final void Function(bool value) toggle;

  @override
  Widget build(BuildContext context) {
    final textStyle = task.isDone
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : null;

    return Visibility(
      visible: !(task.isDone && !showIfDone),
      child: CheckboxListTile(
        side: BorderSide(color: task.priority.color),
        value: task.isDone,
        activeColor: task.priority.color,
        onChanged: (value) => toggle(value ?? false),
        title: Text(task.title, style: textStyle),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (task.description != null && task.description!.isNotEmpty)
              Text(
                task.description!,
                overflow: TextOverflow.ellipsis,
                style: textStyle,
                maxLines: 1,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (task.dueDate != null)
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        size: 16,
                        color: task.priority.color,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        task.dueDate!.humanString,
                        style: textStyle,
                      ),
                    ],
                  )
                else
                  const SizedBox(),
                FutureBuilder(
                  future: task.project.load(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const SizedBox();
                    }

                    final proj = task.project.value ?? defaultProject;

                    return Row(
                      children: [
                        Text(
                          proj.name,
                          style: textStyle,
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.tag,
                          size: 16,
                          color: proj.colorValue.color,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
