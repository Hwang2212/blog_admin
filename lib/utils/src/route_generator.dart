import 'package:arrivo_web/screens/screens.dart';
import 'package:flutter/material.dart';

class Routes {
  static const mainScreen = '/main';
  static const homeScreen = '/home';
  static const userScreen = '/user-screen';
  static const postScreen = '/post-screen';
  static const categoryScreen = '/category-screen';
  static const addPostScreen = '/create-post-screen';
  static const loginScreen = '/';
}

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case Routes.loginScreen:
        builder = (_) => const LoginScreen();
        break;
      case Routes.mainScreen:
        builder = (_) => const MainPage();
        break;
      case Routes.homeScreen:
        builder = (_) => const HomeScreen();
        break;
      case Routes.userScreen:
        builder = (_) => const UserScreen();
        break;
      case Routes.postScreen:
        builder = (_) => const PostScreen();
        break;
      case Routes.addPostScreen:
        builder = (_) => const CreatePostScreen();
        break;
      case Routes.categoryScreen:
        builder = (_) => const CategoryScreen();
        break;

      default:
        throw UnimplementedError();
    }

    return MaterialPageRoute(builder: builder);
  }
}
