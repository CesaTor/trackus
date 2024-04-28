import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/core/core.dart';
import 'package:trackus/features/add_item/presentation/pages/add_item.dart';
import 'package:trackus/features/home/home.dart';

class ItemListModal extends StatelessWidget {
  const ItemListModal({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.select((ItemsCubit cubit) => cubit.state);

    final color = Colors.grey;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Projects', style: TextStyle(fontSize: 30)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryButton(
                title: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Add a new project',
                    style: Theme.of(context).primaryTextTheme.labelLarge,
                  ),
                ),
                leading: const Icon(Icons.add, size: 20),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => AddItem(
                        onAdd: (title, color) {
                          context.read<ItemsCubit>().addItem(
                                Item()
                                  ..name = title
                                  ..colorValue = color.value
                                  ..description = '',
                              );
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Swipe project to view tasks ',
                    style: TextStyle(color: color),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 12, color: color),
                  Icon(Icons.arrow_forward_ios, size: 12, color: color),
                  Icon(Icons.arrow_forward_ios, size: 12, color: color),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ItemsList(items: items),
    );
  }
}
