import 'package:Blog_web/bloc/bloc.dart';
import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/screens/src/post/post_details.dart';
import 'package:Blog_web/theme/theme.dart';
import 'package:Blog_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:Blog_web/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextTheme get textTheme => Theme.of(context).textTheme;

  @override
  void initState() {
    super.initState();
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
                const AppTitleText(title: "Posts"),
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
                    child: SizedBox(
                      child: DataTable(
                          columns: postColumnHeaders
                              .map((e) => DataColumn(label: Text(e)))
                              .toList(),
                          rows: postList
                              .map((e) => DataRow(cells: [
                                    DataCell(Text(e.id.toString())),
                                    DataCell(Text(e.title)),
                                    DataCell(Text(e.categoryId.toString())),
                                    DataCell(Text(e.status)),
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
}
