import 'package:flutter/material.dart';
import 'package:arrivo_web/utils/utils.dart';

class ShowLoading extends StatelessWidget {
  const ShowLoading({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.onPrimaryContainer.withOpacity(.75),
      body: const Align(
        alignment: Alignment.center,
        child: LoadingIndicator(),
      ),
    );
  }
}
