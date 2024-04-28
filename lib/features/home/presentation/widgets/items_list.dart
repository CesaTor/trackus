import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/lib.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.select((AppCubit cubit) => cubit.state.items);
    final entry = context.select((AppCubit cubit) => cubit.state.running);

    return CustomScrollView(
      slivers: <Widget>[
        if (entry != null)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: RunningEntry(entry: entry),
            ),
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = items[index];
              return ListTile(
                leading: ItemColor(color: Color(item.colorValue)),
                title: Text(item.name),
                trailing: IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () => context.read<AppCubit>().start(item),
                ),
              );
            },
            childCount: items.length,
          ),
        ),
      ],
    );
  }
}
