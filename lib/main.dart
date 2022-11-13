import 'package:flutter/material.dart';
import 'package:arrivo_web/utils/src/route_generator.dart';

import 'package:arrivo_web/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(AppThemes.textTheme),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
