import 'package:flutter/material.dart';
import 'package:trackus/features/add_item/presentation/widgets/item_color.dart';

class ItemName extends StatelessWidget {
  const ItemName({
    required this.color,
    required this.onChanged,
    super.key,
  });

  final Color color;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ItemColor(color: color),
            const SizedBox(width: 10),
            TextField(onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
