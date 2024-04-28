import 'package:flutter/material.dart';
import 'package:trackus/core/core.dart';

// class PrimaryButton extends StatelessWidget {
//   const PrimaryButton({
//     required this.text,
//     this.onPressed,
//     super.key,
//   });

//   final VoidCallback? onPressed;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       onPressed: onPressed,
//       color: Theme.of(context).colorScheme.primaryContainer,
//       shape: roudedShape,
//       child: Text(
//         text,
//         style: Theme.of(context).primaryTextTheme.labelLarge,
//       ),
//     );
//   }
// }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    this.text,
    this.onPressed,
    this.leading,
    this.trailing,
    this.title,
    super.key,
  }) : assert(text != null || title != null, 'text or title must be provided');

  final VoidCallback? onPressed;
  final Widget? leading;
  final Widget? trailing;
  final Widget? title;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: roudedShape,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          if (leading != null) leading!,
          if (title != null)
            title!
          else
            Text(
              text!,
              style: Theme.of(context).primaryTextTheme.labelLarge,
            ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
