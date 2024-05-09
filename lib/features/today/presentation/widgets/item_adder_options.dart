part of 'item_adder.dart';

class ItemAdderOptions extends StatefulWidget {
  const ItemAdderOptions({
    required this.onSave,
    required this.projects,
    super.key,
  });

  final void Function(Project project) onSave;
  final Iterable<Project> projects;

  @override
  State<ItemAdderOptions> createState() => _ItemAdderOptionsState();
}

class _ItemAdderOptionsState extends State<ItemAdderOptions> {
  late Project project;

  @override
  void initState() {
    project = widget.projects.first;
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
              const Chip(
                label: Row(
                  children: [
                    Icon(Icons.calendar_today, size: 15),
                    SizedBox(width: 8),
                    Text('Due Date', style: TextStyle(fontSize: 13)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Chip(
                label: Row(
                  children: [
                    Icon(Icons.flag_outlined, size: 15),
                    SizedBox(width: 8),
                    Text('Priority', style: TextStyle(fontSize: 13)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Chip(
                label: Row(
                  children: [
                    Transform.flip(
                      child: const Icon(Icons.sell, size: 15),
                    ),
                    const SizedBox(width: 8),
                    const Text('Tags', style: TextStyle(fontSize: 13)),
                  ],
                ),
              ),
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
                style: const TextStyle(
                  fontSize: 13,
                  decoration: TextDecoration.none,
                ),
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
                onPressed: () => widget.onSave(project),
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
