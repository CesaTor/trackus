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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Projects', style: TextStyle(fontSize: 30)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: PrimaryButton(
            text: 'Add',
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
        ),
      ),
      body: ItemsList(items: items),
    );
  }
}
