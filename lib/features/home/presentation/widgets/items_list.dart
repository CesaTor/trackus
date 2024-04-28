import 'package:flutter/material.dart';
import 'package:trackus/core/core.dart';
import 'package:trackus/features/add_item/presentation/widgets/item_color.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({required this.items, super.key});

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: ItemColor(color: Color(item.colorValue)),
          title: Text(item.name),
          trailing: IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              // start timer
            },
          ),
        );
      },
    );
  }
}
