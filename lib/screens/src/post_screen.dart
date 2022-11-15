import 'package:arrivo_web/theme/theme.dart';
import 'package:arrivo_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:arrivo_web/widgets/widgets.dart';

import '../../widgets/widgets.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextTheme get textTheme => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
            'Posts',
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
        ],
      ),
    );
  }
}
