import 'package:flutter/material.dart';
import 'package:trackus/lib.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    required this.item,
    super.key,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: item.isDone,
          onChanged: (value) {},
        ),
        title: Text(item.title),
        subtitle: item.description != null
            ? Text(
                item.description!,
                overflow: TextOverflow.ellipsis,
              )
            : null,
      ),
    );
  }
}
