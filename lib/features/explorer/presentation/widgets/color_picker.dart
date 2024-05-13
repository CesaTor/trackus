import 'package:flutter/material.dart';
import 'package:trackus/core/global.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    required this.onChanged,
    required this.selectedColor,
    super.key,
  });

  final void Function(Color color) onChanged;
  final Color selectedColor;

  static Future<Color?> show(
    BuildContext context, {
    required Color selectedColor,
  }) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: ColorPicker(
            onChanged: (color) {
              Navigator.of(context).pop(color);
            },
            selectedColor: selectedColor,
          ),
        );
      },
    );
  }

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
            child: ColorPick(
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

class ColorPick extends StatelessWidget {
  const ColorPick({
    required this.color,
    this.isSelected = false,
    super.key,
  });

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Icon(
      isSelected ? Icons.radio_button_checked_outlined : Icons.circle,
      color: color,
      size: isSelected ? 30 : 20,
    );
  }
}
