import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/core/core.dart';
import 'package:trackus/features/add_item/presentation/pages/add_item.dart';
import 'package:trackus/features/home/home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.select((ItemsCubit cubit) => cubit.state);

    return Scaffold(
      appBar: buildAppbar(),
      body: ItemsList(items: items),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        PrimaryButton(
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
          text: 'Add',
        ),
        PrimaryButton(
          onPressed: () => context.read<ItemsCubit>().clearItems(),
          text: 'Clear',
        ),
      ],
    );
  }
}
