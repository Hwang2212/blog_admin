library universal_ui;

import 'dart:developer';
import 'dart:math' as math;
import 'package:arrivo_web/bloc/bloc.dart';
import 'package:arrivo_web/models/models.dart';
import 'package:arrivo_web/utils/src/screen_utils.dart';
import 'package:arrivo_web/utils/utils.dart';
import 'package:arrivo_web/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:arrivo_web/utils/src/dropdown_values.dart' as dv;

import '../../../theme/theme.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final GlobalKey<FormState> _createPostFormKey = GlobalKey<FormState>();
  TextEditingController titleTEC = TextEditingController();
  TextEditingController bodyTEC = TextEditingController();
  TextEditingController categoryTEC = TextEditingController();
  TextEditingController statusTEC = TextEditingController();
  TextEditingController labelTEC = TextEditingController();
  HtmlEditorController controller = HtmlEditorController();

  MemberStatus _label = MemberStatus.normal;
  int _category = 1;
  bool _isValidated = false;

  final FocusNode _focusNode = FocusNode();

  TextTheme get textTheme => Theme.of(context).textTheme;
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
            children: [Center(child: buildContent())],
          ),
        ),
      ),
    );
  }

  Widget buildContent() {
    return Form(
      key: _createPostFormKey,
      child: Container(
        margin: ScreenUtils.contentMargin,
        constraints: ScreenUtils.widthConstraints,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppTitleText(title: "Create Posts"),
            AppCard(
                contentHeight: AppSize.s400,
                title: "Post",
                actionList: [
                  AppElevatedButton(onPressed: () {}, child: const Text('Save'))
                ],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: ScreenUtils.formPadding,
                      child: AppTextFormField(
                        textEditingController: titleTEC,
                        onChanged: onValueChanged,
                        labelText: "Title *",
                      ),
                    ),
                    Padding(
                        padding: ScreenUtils.formPadding,
                        child: DropdownButtonFormField(
                            isDense: true,
                            isExpanded: true,
                            value: _label,
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: "Label *",
                                errorStyle: getLightStyle()
                                    .copyWith(color: AppColors.red),
                                labelStyle: getMediumStyle(
                                    fontSize: 20.0, color: AppColors.black),
                                constraints: const BoxConstraints(
                                    minWidth: 500, maxWidth: 800),
                                errorBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.red)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primary, width: 2)),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s12),
                                    borderSide: const BorderSide(
                                        color: AppColors.primary, width: 2))),
                            items: dv.member
                                .map((e) => DropdownMenuItem(
                                    value: e["id"],
                                    child: Text(e["member"].toString())))
                                .toList(),
                            onChanged: ((value) {
                              setState(() {
                                _label = value as MemberStatus;
                                labelTEC.text = _label.toString();
                              });
                            }))),
                    Padding(
                        padding: ScreenUtils.formPadding,
                        child: DropdownButtonFormField(
                            isDense: true,
                            isExpanded: true,
                            value: _category,
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: "Category *",
                                errorStyle: getLightStyle()
                                    .copyWith(color: AppColors.red),
                                labelStyle: getMediumStyle(
                                    fontSize: 20.0, color: AppColors.black),
                                constraints: const BoxConstraints(
                                    minWidth: 500, maxWidth: 800),
                                errorBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.red)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primary, width: 2)),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s12),
                                    borderSide: const BorderSide(
                                        color: AppColors.primary, width: 2))),
                            items: dv.categoryId
                                .map((e) => DropdownMenuItem(
                                    value: e["id"],
                                    child: Text(e["category"].toString())))
                                .toList(),
                            onChanged: ((value) {
                              setState(() {
                                _category = value as int;
                                categoryTEC.text = _category.toString();
                              });
                            })))
                  ],
                )),
            buildTextEditor(),
            Container(
                margin: EdgeInsets.only(top: AppMargin.m20),
                child: AppElevatedButton(
                    onPressed: _isValidated ? onTapCreatePost : () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.group_add),
                        SizedBox(
                          width: AppSize.s20,
                        ),
                        Text('Save'),
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  Widget buildTextEditor() {
    return Container(
      margin: ScreenUtils.formPadding,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: ScreenUtils.formPadding,
            child: const Text("Body"),
          ),
          const Divider(),
          HtmlEditor(
            controller: controller, //required

            htmlEditorOptions: const HtmlEditorOptions(
              shouldEnsureVisible: true,
              hint: "Pen your creativity",
            ),
            htmlToolbarOptions: const HtmlToolbarOptions(
                toolbarType: ToolbarType.nativeGrid,
                gridViewHorizontalSpacing: 0,
                initiallyExpanded: false),
            otherOptions: OtherOptions(
                height: 500,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12))),
          )
        ],
      ),
    );
  }

  void onValueChanged(String? value) {
    _isValidated = _createPostFormKey.currentState?.validate() ?? false;
    setState(() {});
  }

  void onTapCreatePost() async {
    PostBloc postBloc = BlocProvider.of<PostBloc>(context);
    NavigatorState navigatorState = Navigator.of(context);
    if (_isValidated) {
      final PostModel newPost = PostModel(
        id: math.Random().nextInt(1000),
        body: await controller.getText(),
        categoryId: int.parse(categoryTEC.text),
        label: _label,
        status: "Pending",
        title: titleTEC.text,
      );

      // Call PostBloc here

      postBloc.add(AddPost(newPost));
      // navigatorState.pop;
      navigatorState.pushNamedAndRemoveUntil(
          Routes.postScreen, ((route) => false));

      log("User Added: ${StagingUser.userList.toString()}");
    } else if (_isValidated == false) {
      ScaffoldMessengerState().showSnackBar(
          const SnackBar(content: Text("Please enter required fields")));
    }
  }
}
