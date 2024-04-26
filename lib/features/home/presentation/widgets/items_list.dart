import 'package:flutter/material.dart';
import 'package:trackus/core/core.dart';

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
          leading: CircleAvatar(backgroundColor: Color(item.colorValue)),
          title: Text(item.name),
          subtitle: Text(item.description),
        );
      },
    );
  }
}
