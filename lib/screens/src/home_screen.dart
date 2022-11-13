import 'package:arrivo_web/theme/theme.dart';
import 'package:flutter/material.dart';

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
      drawer: const AppDrawer(),
      appBar: AppBar(title: Text('Arrivo Admin')),
      body: Stack(
        children: [
          titleText(),
          buildMainContent(),
        ],
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
      margin: EdgeInsets.symmetric(
          vertical: AppMargin.m80, horizontal: AppMargin.m30),
      child: Column(
        children: [
          AppCard(
            title: 'Users',
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
            child: Center(
              child: ClipRRect(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Post Image')),
                    DataColumn(label: Text('Title')),
                    DataColumn(label: Text('Category ID')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Label')),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('Image')),
                      DataCell(Text('Title 1')),
                      DataCell(Text('1')),
                      DataCell(Text('1')),
                      DataCell(Text('Normal')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('Image 2')),
                      DataCell(Text('Title 2')),
                      DataCell(Text('2')),
                      DataCell(Text('2')),
                      DataCell(Text('Normal')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('Image')),
                      DataCell(Text('Title 1')),
                      DataCell(Text('1')),
                      DataCell(Text('1')),
                      DataCell(Text('Normal')),
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
