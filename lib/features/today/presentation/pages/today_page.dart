import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/features/task/presentation/widgets/task_item.dart';
import 'package:trackus/lib.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodayCubit(
        getTodayItems: GetTodayItems(context.read()),
        getAllProjects: GetAllProjects(context.read()),
      )..init(),
      child: _TodayView(),
    );
  }
}

class _TodayView extends StatelessWidget {
  void updateState(BuildContext context) {
    context.read<TodayCubit>().init();
  }

  void addItem(BuildContext context, Item item) {
    context.read<AppCubit>().addItem(item).then((_) => updateState(context));
  }

  @override
  Widget build(BuildContext context) {
    final projects = context.select((TodayCubit cubit) => cubit.state.projects);

    return Scaffold(
      appBar: AppBar(title: const Text('Today')),
      body: BlocBuilder<TodayCubit, TodayState>(
        builder: (context, state) {
          final items = state.items;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return TaskItem(item: item);
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
                onAdd: (item) {
                  addItem(currContext, item);
                },
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
