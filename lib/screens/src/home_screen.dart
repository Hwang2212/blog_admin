import 'package:Blog_web/bloc/bloc.dart';
import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/screens/src/post/post_details.dart';
import 'package:Blog_web/theme/theme.dart';
import 'package:Blog_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:Blog_web/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Container(
      margin: ScreenUtils.contentMargin,
      child: Column(
        children: [
          const AppTitleText(title: "Dashboard"),
          buildUserCard(),
          buildPostTable(),
          buildCategoryList()
        ],
      ),
    );
  }

  void onTapAddPost() {
    Navigator.pushNamed(context, Routes.addPostScreen);
  }

  Widget buildCategoryList() {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryLoading) {
        return const ShowLoading();
      }

      if (state is CategoryLoaded) {
        final categoryList = state.categoryList;
        return Container(
          margin: EdgeInsets.symmetric(
              vertical: AppMargin.m100, horizontal: AppMargin.m30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTitleText(title: "Category"),
              AppElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.addCategoryScreen);
                  },
                  child: const Text('Add Another Category')),
              Container(
                height: AppSize.s800,
                width: 2000,
                padding: ScreenUtils.contentMargin,
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p10,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 3),
                  // padding: ScreenUtils.contentMargin,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                          margin: ScreenUtils.contentMargin,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Text(
                              categoryList[index].name,
                              style: getBoldStyle(fontSize: 28),
                            ),
                            categoryList[index].activated == 1
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: AppColors.yellow,
                                      ),
                                      Text(
                                        "Activated",
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
                              "Description",
                              style: getLightStyle(
                                  fontSize: 10,
                                  color: Colors.black54,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(categoryList[index].description),
                            // Container(
                            //     alignment: Alignment.center,
                            //     child: Html(
                            //         data: categoryList[index]
                            //             .description)),
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
                                    BlocProvider.of<CategoryBloc>(context,
                                            listen: false)
                                        .add(RemoveCategory(
                                            categoryList[index]));
                                  },
                                  buttonColor: AppColors.red,
                                  child: const Icon(Icons.delete),
                                ),
                              ],
                            )
                          ])),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      } else if (state is CategoryError) {
        return Center(
          child: Text(state.error),
        );
      }
      return Container();
    });
  }

  Widget buildPostTable() {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostLoading) {
          return const ShowLoading();
        }
        if (state is PostLoaded) {
          final postList = state.postList;
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
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.addPostScreen);
                          },
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
                          rows: postList
                              .map((e) => DataRow(cells: [
                                    DataCell(Text(e.id.toString())),
                                    DataCell(Text(e.title)),
                                    DataCell(Text(e.categoryId.toString())),
                                    DataCell(Text(e.status!)),
                                    DataCell(e.label == MemberStatus.premium
                                        ? const Icon(
                                            Icons.star,
                                            color: AppColors.yellow,
                                          )
                                        : const Text("Normal")),
                                    DataCell(Row(
                                      children: [
                                        AppElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PostDetailScreen(
                                                          postModel: e,
                                                        )));
                                          },
                                          buttonColor: AppColors.yellow,
                                          child:
                                              const Icon(Icons.remove_red_eye),
                                        ),
                                        const SizedBox(
                                          width: AppSize.s10,
                                        ),
                                        AppElevatedButton(
                                          onPressed: () {
                                            BlocProvider.of<PostBloc>(context,
                                                    listen: false)
                                                .add(RemovePost(e));
                                          },
                                          buttonColor: AppColors.red,
                                          child: const Icon(Icons.delete),
                                        ),
                                      ],
                                    )),
                                  ]))
                              .toList()),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is PostError) {
          return Center(
            child: Text(state.error),
          );
        }
        return Container();
      },
    );
  }

  Widget buildUserCard() {
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
