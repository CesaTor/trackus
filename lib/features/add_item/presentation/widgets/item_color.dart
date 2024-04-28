import 'package:flutter/material.dart';

class ItemColor extends StatelessWidget {
  const ItemColor({
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
