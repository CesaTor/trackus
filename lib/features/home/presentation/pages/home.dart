import 'package:flutter/material.dart';
import 'package:trackus/core/core.dart';
import 'package:trackus/features/home/home.dart';
import 'package:trackus/features/item_list/presentation/pages/item_list_modal.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(i18n.core.appName)),
      body: const ItemsList(),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        child: PrimaryButton(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (context) => const ItemListModal(),
            );
          },
          leading: const Icon(Icons.keyboard_arrow_up),
          title: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Items',
              style: Theme.of(context).primaryTextTheme.labelLarge,
            ),
          ),
          // text: 'Items',
        ),
      ),
    );
  }
}
