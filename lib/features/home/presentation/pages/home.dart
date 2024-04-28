import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackus/core/core.dart';
import 'package:trackus/features/home/home.dart';
import 'package:trackus/features/item_list/presentation/pages/item_list_modal.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.select((ItemsCubit cubit) => cubit.state);

    return Scaffold(
      appBar: buildAppbar(),
      body: ItemsList(items: items),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (context) => const ItemListModal(),
          );
        },
        child: const Text('Items'),
      ),
    );
  }
}
