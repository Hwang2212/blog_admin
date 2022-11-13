import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? buttonColor;

  const AppElevatedButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
      child: child,
    );
  }
}
