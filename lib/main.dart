import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:arrivo_web/utils/src/route_generator.dart';
import 'generated/locale_keys.g.dart';

import 'package:arrivo_web/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [Locale('en', 'US')],
      fallbackLocale: Locale('en', 'US'),
      path: 'assets/translations'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: getAppTheme(AppThemes.textTheme),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
