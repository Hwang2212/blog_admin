import 'package:Blog_web/bloc/bloc.dart';
import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/theme/theme.dart';
import 'package:Blog_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:Blog_web/widgets/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailScreen extends StatefulWidget {
  final PostModel? postModel;
  const PostDetailScreen({super.key, this.postModel});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  TextTheme get textTheme => Theme.of(context).textTheme;
  PostModel get post => widget.postModel!;

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
        child: Stack(children: [
          SingleChildScrollView(child: Center(child: buildMainContent()))
        ]),
      ),
    );
  }

  Widget buildMainContent() {
    return Container(
      margin: ScreenUtils.contentMargin,
      child: Column(
        children: [
          const AppTitleText(title: "Post Detail"),
          AppCard(
            title: post.title!,
            actionList: [
              Row(
                children: [
                  AppElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.addPostScreen);
                    },
                    buttonColor: AppColors.yellow,
                    child: const Icon(Icons.edit),
                  ),
                ],
              ),
            ],
            child: Container(
                margin: ScreenUtils.contentMargin.copyWith(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Status",
                      style: getLightStyle(
                          fontSize: 10,
                          color: Colors.black54,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(post.status ?? "No Status"),
                    Text(
                      "Label",
                      style: getLightStyle(
                          fontSize: 10,
                          color: Colors.black54,
                          fontStyle: FontStyle.italic),
                    ),
                    Row(
                      children: [
                        post.label == MemberStatus.premium
                            ? const Icon(
                                Icons.star,
                                color: AppColors.yellow,
                              )
                            : Container(),
                        Text(post.label == MemberStatus.normal
                            ? "Normal"
                            : "Premium Content"),
                      ],
                    ),
                    Text(
                      "Body",
                      style: getLightStyle(
                          fontSize: 10,
                          color: Colors.black54,
                          fontStyle: FontStyle.italic),
                    ),
                    const Divider(),
                    Html(data: post.body),
                  ],
                )),
          ),
          Text(
            "Comments",
            style: textTheme.bodyLarge,
          ),
          buildCommentsCard()
        ],
      ),
    );
  }

  Widget buildCommentsCard() {
    return BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
      if (state is CommentLoading) {
        return const ShowLoading();
      }
      if (state is CommentLoaded) {
        List<CommentModel> comments = state.commentList;
        return Container(
            padding: ScreenUtils.formPadding,
            margin: ScreenUtils.contentMargin,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(comments.length, ((index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          comments[index].name ?? "Name",
                          style: getBoldStyle(
                              fontSize: 20, color: AppColors.primary),
                        ),
                        Text(
                          comments[index].email ?? "What",
                          style: getLightStyle(
                              fontSize: 10,
                              color: Colors.black54,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s10,
                    ),
                    Text(
                      comments[index].body ?? "Body",
                      style: getMediumStyle(fontSize: 12),
                    ),
                    const Divider()
                  ],
                );
              })),
            ));
      } else if (state is CommentError) {
        return Center(
          child: Text(state.error),
        );
      }
      return Container();
    });
  }
}
