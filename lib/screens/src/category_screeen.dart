import 'package:arrivo_web/theme/theme.dart';
import 'package:arrivo_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:arrivo_web/widgets/widgets.dart';

import '../../widgets/widgets.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
            'Categories',
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
