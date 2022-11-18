import 'dart:developer';

import 'package:arrivo_web/bloc/bloc.dart';
import 'package:arrivo_web/models/models.dart';
import 'package:arrivo_web/theme/theme.dart';
import 'package:arrivo_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:arrivo_web/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextTheme get textTheme => Theme.of(context).textTheme;

  @override
  void initState() {
    super.initState();

    // BlocProvider.of<UserBloc>(context, listen: false).add(LoadUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.addUserScreen);
                          },
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
                            userList
                                .where((user) =>
                                    user.membership == MemberStatus.normal)
                                .length
                                .toString(),
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
                            userList
                                .where((user) =>
                                    user.membership == MemberStatus.premium)
                                .length
                                .toString(),
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
                      mainAxisSpacing: 3),
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                          margin: ScreenUtils.contentMargin,
                          child: Column(children: [
                            CircleAvatar(
                              backgroundColor: userList[index].membership ==
                                      MemberStatus.premium
                                  ? AppColors.yellow
                                  : AppColors.primary,
                              radius: AppSize.s50,
                              child: const Icon(Icons.people),
                            ),
                            Text(
                              userList[index].fullName,
                              style: getBoldStyle(fontSize: FontSize.s28),
                            ),
                            userList[index].membership == MemberStatus.premium
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
                                : const SizedBox(
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
                                ),
                                const SizedBox(
                                  width: AppSize.s15,
                                ),
                                AppElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<UserBloc>(context,
                                            listen: false)
                                        .add(RemoveUser(userList[index]));
                                  },
                                  buttonColor: AppColors.red,
                                  child: const Icon(Icons.delete),
                                ),
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
