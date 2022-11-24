import 'package:Blog_web/bloc/auth/auth_bloc.dart';
import 'package:Blog_web/bloc/bloc.dart';
import 'package:Blog_web/bloc/post/post_bloc.dart';
import 'package:Blog_web/bloc/user/user_bloc.dart';
import 'package:Blog_web/repositories/repositories.dart';
import 'package:Blog_web/repositories/src/category_repository.dart';
import 'package:Blog_web/repositories/src/comment_repository.dart';
import 'package:Blog_web/repositories/src/post_repository.dart';
import 'package:Blog_web/services/src/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Blog_web/utils/src/route_generator.dart';

import 'package:Blog_web/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US')],
      fallbackLocale: Locale('en', 'US'),
      path: '/translations',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedPreferencesService sharedPreferencesService =
        SharedPreferencesService();
    final UserRepository userRepository = UserRepository();
    final CategoryRepository categoryRepository = CategoryRepository();
    final PostRepository postRepository = PostRepository();
    final CommentRepository commentRepository = CommentRepository();
    MaterialApp app = MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: getAppTheme(AppThemes.textTheme),
      initialRoute: Routes.loginScreen,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
    return MultiBlocProvider(providers: [
      BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(sharedPreferencesService)),
      BlocProvider<PostBloc>(
          create: (context) => PostBloc(postRepository)..add(LoadPost())),
      BlocProvider<UserBloc>(
          create: (context) => UserBloc(userRepository)..add(LoadUser())),
      BlocProvider<CategoryBloc>(
          create: (context) =>
              CategoryBloc(categoryRepository)..add(LoadCategory())),
      BlocProvider<CommentBloc>(
          create: (context) => CommentBloc(commentRepository)),
    ], child: app);
  }
}
