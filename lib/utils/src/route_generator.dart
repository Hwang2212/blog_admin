import 'package:arrivo_web/screens/screens.dart';
import 'package:flutter/material.dart';

class Routes {
  static const homeScreen = '/';
}

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case Routes.homeScreen:
        builder = (_) => const HomeScreen();
        break;
      default:
        throw UnimplementedError();
    }

    return MaterialPageRoute(builder: builder);
  }
}
