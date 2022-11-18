import 'package:arrivo_web/models/models.dart';
import 'package:arrivo_web/theme/theme.dart';
import 'package:arrivo_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:arrivo_web/widgets/widgets.dart';
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
          const AppTitleText(title: "Post Detail"),
          AppCard(
            title: post.title,
            actionList: [
              Row(
                children: [
                  AppElevatedButton(
                    onPressed: () {},
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
                    Text(post.status),
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
                            ? Icon(
                                Icons.star,
                                color: AppColors.yellow,
                              )
                            : Container(),
                        Text(post.label == MemberStatus.normal
                            ? "Normal"
                            : "Premium Content"),
                      ],
                    ),
                    Divider(),
                    Html(data: post.body)
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
