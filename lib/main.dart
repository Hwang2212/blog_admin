import 'package:arrivo_web/bloc/auth/auth_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:arrivo_web/utils/src/route_generator.dart';

import 'package:arrivo_web/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [Locale('en', 'US')],
      fallbackLocale: Locale('en', 'US'),
      path: '/translations'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialApp app = MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: getAppTheme(AppThemes.textTheme),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
    return MultiBlocProvider(
        providers: [BlocProvider<AuthBloc>(create: (context) => AuthBloc())],
        child: app);
  }
}
