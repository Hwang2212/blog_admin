import 'package:arrivo_web/theme/theme.dart';
import 'package:arrivo_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:arrivo_web/widgets/widgets.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextTheme get textTheme => Theme.of(context).textTheme;

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
            'Dashboard',
            style: textTheme.headlineLarge,
          )
        ],
      ),
    );
  }

  Widget buildMainContent() {
    return Container(
      // constraints:
      //     BoxConstraints(minWidth: AppSize.s800, maxWidth: AppSize.s1200),
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
          AppCard(
            title: 'Post',
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
            child: Center(
              child: ClipRRect(
                child: DataTable(
                  columns: postColumnHeaders
                      .map((e) => DataColumn(label: Text(e)))
                      .toList(),
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('Title 1')),
                      DataCell(Text('1')),
                      DataCell(Text('1')),
                      DataCell(Text('Normal')),
                      DataCell(Text('Button')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('Title 2')),
                      DataCell(Text('2')),
                      DataCell(Text('2')),
                      DataCell(Text('Normal')),
                      DataCell(Text('Button')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('Title 1')),
                      DataCell(Text('1')),
                      DataCell(Text('1')),
                      DataCell(Text('Normal')),
                      DataCell(Text('Button')),
                    ]),
                  ],
                ),
              ),
            ),
          ),
          AppCard(
            title: 'Category',
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
            child: Center(
              child: ClipRRect(
                child: DataTable(
                  columns: categoryColumnHeaders
                      .map((e) => DataColumn(label: Text(e)))
                      .toList(),
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('Title 1')),
                      DataCell(Text('1')),
                      DataCell(Text('1')),
                      DataCell(Text('Button')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('Title 2')),
                      DataCell(Text('2')),
                      DataCell(Text('2')),
                      DataCell(Text('Button')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('Title 1')),
                      DataCell(Text('1')),
                      DataCell(Text('1')),
                      DataCell(Text('Button')),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
