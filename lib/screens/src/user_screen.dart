import 'package:arrivo_web/theme/theme.dart';
import 'package:arrivo_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:arrivo_web/widgets/widgets.dart';

import '../../widgets/widgets.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextTheme get textTheme => Theme.of(context).textTheme;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const AppDrawer(),

      body: SingleChildScrollView(
        child: Stack(
          children: [
            titleText(),
            buildMainContent(),
          ],
        ),
      ),
    );
  }

  Widget titleText() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p30),
      child: Row(
        children: [
          Text(
            'Users',
            style: textTheme.headlineLarge,
          )
        ],
      ),
    );
  }

  Widget buildMainContent() {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: AppMargin.m100, horizontal: AppMargin.m30),
      child: Column(
        children: [
          AppCard(
            title: 'Users',
            actionList: [
              Row(
                children: [
                  AppElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.add_box_outlined),
                  ),
                  SizedBox(
                    width: AppMargin.m10,
                  ),
                  AppElevatedButton(
                    onPressed: () {},
                    buttonColor: AppColors.yellow,
                    child: const Icon(Icons.remove_red_eye_outlined),
                  ),
                ],
              ),
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '20',
                      style: textTheme.bodyLarge
                          ?.copyWith(color: AppColors.primary),
                    ),
                    Text(
                      'Normal',
                      style: textTheme.bodyMedium
                          ?.copyWith(color: AppColors.primary),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '15',
                      style: textTheme.bodyLarge
                          ?.copyWith(color: AppColors.yellow),
                    ),
                    Text(
                      'Premium',
                      style: textTheme.bodyMedium
                          ?.copyWith(color: AppColors.yellow),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
