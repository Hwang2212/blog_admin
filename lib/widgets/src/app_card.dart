import 'package:flutter/material.dart';
import 'package:arrivo_web/theme/theme.dart';

class AppCard extends StatelessWidget {
  final String title;
  final Widget child;
  const AppCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p10),
            child: Text(
              title,
              style: textTheme.bodyLarge,
            ),
          ),
          const Divider(),
          child
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Column(
          //       children: [
          //         Text(
          //           '20',
          //           style:
          //               textTheme.bodyLarge?.copyWith(color: AppColors.primary),
          //         ),
          //         Text(
          //           'Normal',
          //           style: textTheme.bodyMedium
          //               ?.copyWith(color: AppColors.primary),
          //         )
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         Text(
          //           '15',
          //           style:
          //               textTheme.bodyLarge?.copyWith(color: AppColors.yellow),
          //         ),
          //         Text(
          //           'Premium',
          //           style:
          //               textTheme.bodyMedium?.copyWith(color: AppColors.yellow),
          //         )
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
