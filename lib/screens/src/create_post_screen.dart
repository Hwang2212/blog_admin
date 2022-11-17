library universal_ui;

import 'package:arrivo_web/utils/src/screen_utils.dart';
import 'package:arrivo_web/widgets/src/app_card.dart';
import 'package:arrivo_web/widgets/src/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../theme/theme.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController titleTEC = TextEditingController();
  TextEditingController bodyTEC = TextEditingController();
  TextEditingController categoryTEC = TextEditingController();
  TextEditingController statusTEC = TextEditingController();
  TextEditingController labelTEC = TextEditingController();
  HtmlEditorController controller = HtmlEditorController();

  FocusNode _focusNode = FocusNode();

  TextTheme get textTheme => Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [titleText(), buildContent()],
      ),
    );
  }

  Widget titleText() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p30),
      child: Row(
        children: [
          Text(
            'Create Posts',
            style: textTheme.headlineLarge,
          )
        ],
      ),
    );
  }

  Widget buildContent() {
    EdgeInsets formPadding = const EdgeInsets.symmetric(
        horizontal: AppPadding.p10, vertical: AppPadding.p15);
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: AppMargin.m100, horizontal: AppMargin.m30),
      child: AppCard(
          contentHeight: AppSize.s5000,
          title: "Post",
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: formPadding,
                  child: AppTextFormField(
                    textEditingController: titleTEC,
                    labelText: "Title",
                  ),
                ),
                Padding(
                  padding: formPadding,
                  child: AppTextFormField(
                    textEditingController: categoryTEC,
                    labelText: "Category",
                  ),
                ),
                Padding(
                  padding: formPadding,
                  child: AppTextFormField(
                    textEditingController: labelTEC,
                    labelText: "Label",
                  ),
                ),
                Text("Body"),
                Divider(),
                HtmlEditor(
                  controller: controller, //required
                  htmlEditorOptions: HtmlEditorOptions(
                    hint: "Pen your creativity",
                  ),
                  otherOptions: OtherOptions(
                      height: 250,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12))),
                )
              ],
            ),
          )),
    );
  }
}
