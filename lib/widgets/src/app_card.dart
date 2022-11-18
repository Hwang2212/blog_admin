import 'package:flutter/material.dart';
import 'package:Blog_web/theme/theme.dart';

class AppCard extends StatelessWidget {
  final String title;
  final Widget child;
  final double? contentHeight;
  final List<Widget>? actionList;
  const AppCard(
      {super.key,
      required this.title,
      required this.child,
      this.actionList,
      this.contentHeight});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.only(top: AppMargin.m20),
      child: SizedBox(
        height: contentHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p10, vertical: AppPadding.p5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyLarge,
                  ),
                  ...?actionList
                ],
              ),
            ),
            const Divider(),
            Center(child: child)
          ],
        ),
      ),
    );
  }
}
