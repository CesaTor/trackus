part of 'item_adder.dart';

class ItemAdderOptions extends StatefulWidget {
  const ItemAdderOptions({
    required this.onSave,
    required this.projects,
    this.dafaultDueDate,
    super.key,
  });

  final void Function(
    Project? project,
    DateTime? dueDate,
    Priority priority,
  ) onSave;
  final Iterable<Project> projects;
  final DateTime? dafaultDueDate;

  @override
  State<ItemAdderOptions> createState() => _ItemAdderOptionsState();
}

class _ItemAdderOptionsState extends State<ItemAdderOptions> {
  Project? project;
  DateTime? dueDate;
  TimeOfDay? dueTime;
  late Priority priority;

  @override
  void initState() {
    project = widget.projects.firstOrNull;
    dueDate = widget.dafaultDueDate;
    priority = Priority.none;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 16),
              _ItemDatePicker(
                currentDate: dueDate,
                onChange: (value) => setState(() => dueDate = value),
              ),
              const SizedBox(width: 8),
              _ItemTimePicker(
                currentTime: dueTime,
                onChange: (value) => setState(() => dueTime = value),
              ),
              const SizedBox(width: 8),
              _ItemPriorityPicker(
                currentPriority: priority,
                onChange: (value) => setState(() => priority = value),
              ),
              const SizedBox(width: 8),
              // TODO(ct): Implement tags
              // Chip(
              //   label: Row(
              //     children: [
              //       Transform.flip(
              //         child: const Icon(Icons.sell, size: 15),
              //       ),
              //       const SizedBox(width: 8),
              //       const Text('Tags', style: TextStyle(fontSize: 13)),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<Project>(
                value: project,
                underline: const SizedBox(),
                items: widget.projects
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Row(
                          children: [
                            Icon(e.icon, size: 15),
                            const SizedBox(width: 8),
                            Text(e.name),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value != null) project = value;
                  });
                },
              ),
              IconButton(
                onPressed: () {
                  var date = dueDate;
                  if (dueTime != null) {
                    date = date?.copyWith(
                      hour: dueTime!.hour,
                      minute: dueTime!.minute,
                    );
                  }

                  widget.onSave(
                    project,
                    date,
                    priority,
                  );
                },
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ItemDatePicker extends StatelessWidget {
  const _ItemDatePicker({
    required this.currentDate,
    required this.onChange,
  });

  final DateTime? currentDate;
  final void Function(DateTime value) onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final now = DateTime.now();
        final last = now.add(const Duration(days: 365));
        final res = (await showDatePicker(
          context: context,
          initialDate: now,
          firstDate: now,
          lastDate: last,
        ))
            ?.end;
        if (res == null) return;
        onChange(res);
      },
      child: Chip(
        label: Row(
          children: [
            const Icon(Icons.calendar_today, size: 15),
            const SizedBox(width: 8),
            Text(
              currentDate?.humanString ?? 'Due Date',
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemTimePicker extends StatelessWidget {
  const _ItemTimePicker({
    required this.currentTime,
    required this.onChange,
  });

  final TimeOfDay? currentTime;
  final void Function(TimeOfDay value) onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final res = await showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 12, minute: 0),
        );
        if (res == null) return;
        onChange(res);
      },
      child: Chip(
        label: Row(
          children: [
            const Icon(Icons.schedule, size: 15),
            const SizedBox(width: 8),
            Text(
              shortTime(currentTime),
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  String shortTime(TimeOfDay? tod) {
    if (tod == null) return 'All day';
    return '${tod.hour}:${tod.minute < 10 ? '0' : ''}${tod.minute}';
  }
}

class _ItemPriorityPicker extends StatelessWidget {
  const _ItemPriorityPicker({
    required this.currentPriority,
    required this.onChange,
  });

  final Priority currentPriority;
  final void Function(Priority value) onChange;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Priority>(
      itemBuilder: (context) {
        return Priority.values
            .map(
              (e) => PopupMenuItem(
                value: e,
                child: Row(
                  children: [
                    Icon(Icons.flag_outlined, size: 15, color: e.color),
                    const SizedBox(width: 8),
                    Text(e.name),
                  ],
                ),
              ),
            )
            .toList();
      },
      onSelected: onChange,
      child: Chip(
        label: Row(
          children: [
            Icon(Icons.flag_outlined, size: 15, color: currentPriority.color),
            const SizedBox(width: 8),
            Text(
              currentPriority.name,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
