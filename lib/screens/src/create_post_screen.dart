library universal_ui;

import 'package:arrivo_web/utils/src/app_assets.dart';
import 'package:arrivo_web/utils/src/screen_utils.dart';
import 'package:arrivo_web/widgets/src/app_card.dart';
import 'package:arrivo_web/widgets/src/app_elevated_button.dart';
import 'package:arrivo_web/widgets/src/app_text_form_field.dart';
import 'package:arrivo_web/widgets/widgets.dart';
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

  EdgeInsets formPadding = const EdgeInsets.symmetric(
      horizontal: AppPadding.p10, vertical: AppPadding.p15);
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
            children: [
              // const ImageBackground(
              //   backgroundPath: AppAssets.background,
              // ),
              Center(child: buildContent())
            ],
          ),
        ),
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
    return Container(
      margin: ScreenUtils.contentMargin,
      constraints: ScreenUtils.widthConstraints,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          titleText(),
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
                    padding: formPadding,
                    child: AppTextFormField(
                      textEditingController: titleTEC,
                      labelText: "Title *",
                    ),
                  ),
                  Padding(
                    padding: formPadding,
                    child: AppTextFormField(
                      textEditingController: categoryTEC,
                      labelText: "Category *",
                    ),
                  ),
                  Padding(
                    padding: formPadding,
                    child: AppTextFormField(
                      textEditingController: labelTEC,
                      labelText: "Label *",
                    ),
                  )
                ],
              )),
          buildTextEditor(),
          AppElevatedButton(onPressed: () {}, child: const Text('Save'))
        ],
      ),
    );
  }

  Widget buildTextEditor() {
    return Container(
      margin: formPadding,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: formPadding,
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
}
