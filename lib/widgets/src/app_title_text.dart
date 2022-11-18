import 'package:flutter/material.dart';

import '../../theme/src/app_padding.dart';

class AppTitleText extends StatelessWidget {
  final String title;
  const AppTitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p30),
      child: Row(
        children: [
          Text(
            title,
            style: textTheme.headlineLarge,
          )
        ],
      ),
    );
  }
}
