import 'dart:developer';

import 'package:arrivo_web/bloc/bloc.dart';
import 'package:arrivo_web/theme/theme.dart';
import 'package:arrivo_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:arrivo_web/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';

import '../../widgets/widgets.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextTheme get textTheme => Theme.of(context).textTheme;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Arrivo Web"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[AppColors.gradient1, AppColors.gradient2])),
        child: SingleChildScrollView(
          child: Stack(
            children: [Center(child: buildMainContent())],
          ),
        ),
      ),
    );
  }

  Widget buildMainContent() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const ShowLoading();
        }
        if (state is UserLoaded) {
          final userList = state.userList;
          return Container(
            margin: ScreenUtils.contentMargin,
            child: Column(
              children: [
                const AppTitleText(title: "User"),
                AppCard(
                  title: 'Users',
                  actionList: [
                    Row(
                      children: [
                        AppElevatedButton(
                          onPressed: () {},
                          child: Constants.userIcon,
                        ),
                        SizedBox(
                          width: AppMargin.m10,
                        ),
                        AppElevatedButton(
                          onPressed: () {},
                          buttonColor: AppColors.yellow,
                          child: Constants.viewIcon,
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
                            userList.length.toString(),
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
                            userList.length.toString(),
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
                Container(
                  margin: const EdgeInsets.only(top: AppPadding.p30),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "User List:",
                    style: getMediumStyle(fontSize: FontSize.s28),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p10,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      // childAspectRatio: 4,
                      // mainAxisExtent: AppSize.s30,
                      mainAxisSpacing: 3),
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                          margin: ScreenUtils.contentMargin,
                          child: Column(children: [
                            CircleAvatar(
                              backgroundColor: userList[index].membership == 2
                                  ? AppColors.yellow
                                  : AppColors.primary,
                              radius: AppSize.s50,
                              child: const Icon(Icons.people),
                            ),
                            Text(
                              userList[index].fullName,
                              style: getBoldStyle(fontSize: FontSize.s28),
                            ),
                            userList[index].membership == 2
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: AppColors.yellow,
                                      ),
                                      Text(
                                        "Premium User",
                                        style: getLightStyle(
                                            fontSize: 10,
                                            color: Colors.black54,
                                            fontStyle: FontStyle.italic),
                                      )
                                    ],
                                  )
                                : SizedBox(
                                    height: AppSize.s20,
                                  ),
                            Text(
                              "Email",
                              style: getLightStyle(
                                  fontSize: 10,
                                  color: Colors.black54,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(userList[index].email ?? 'No Email'),
                            Text(
                              "Username",
                              style: getLightStyle(
                                  fontSize: 10,
                                  color: Colors.black54,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(userList[index].username),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppElevatedButton(
                                  onPressed: () {},
                                  buttonColor: AppColors.yellow,
                                  child: const Icon(Icons.edit),
                                ),
                                const SizedBox(
                                  width: AppSize.s15,
                                ),
                                AppElevatedButton(
                                  onPressed: () {},
                                  buttonColor: AppColors.yellow,
                                  child: const Icon(Icons.search),
                                )
                              ],
                            )
                          ])),
                    );
                  },
                )
              ],
            ),
          );
        } else if (state is UserError) {
          return Center(
            child: Text(state.error),
          );
        }
        return Container();
      },
    );
  }
}
