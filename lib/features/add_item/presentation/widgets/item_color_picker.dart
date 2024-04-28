import 'package:flutter/material.dart';
import 'package:trackus/core/global.dart';
import 'package:trackus/features/add_item/presentation/widgets/item_color.dart';

class ItemColorPicker extends StatelessWidget {
  const ItemColorPicker({
    required this.onChanged,
    required this.selectedColor,
    super.key,
  });

  final void Function(Color color) onChanged;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final color = projectColors[index];
        return GestureDetector(
          onTap: () => onChanged(color),
          child: Center(
            child: ItemColor(
              color: color,
              isSelected: color == selectedColor,
            ),
          ),
        );
      },
      itemCount: projectColors.length,
    );
  }
}
