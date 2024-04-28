import 'package:flutter/material.dart';
import 'package:trackus/core/core.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: roudedShape,
      child: Text(
        text,
        style: Theme.of(context).primaryTextTheme.labelLarge,
      ),
    );
  }
}

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    required this.text,
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: roudedShape,
      child: Text(
        text,
        style: Theme.of(context).primaryTextTheme.labelLarge,
      ),
    );
  }
}
