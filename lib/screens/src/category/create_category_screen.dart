library universal_ui;

import 'dart:developer';
import 'dart:math' as math;
import 'package:Blog_web/bloc/bloc.dart';
import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/utils/utils.dart';
import 'package:Blog_web/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:Blog_web/utils/src/dropdown_values.dart' as dv;

import '../../../theme/theme.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  final GlobalKey<FormState> _createCategoryFormKey = GlobalKey<FormState>();
  TextEditingController nameTEC = TextEditingController();
  TextEditingController descriptionTEC = TextEditingController();
  TextEditingController activateTEC = TextEditingController();
  HtmlEditorController controller = HtmlEditorController();

  int _activate = 1;
  bool _isValidated = false;

  final FocusNode _focusNode = FocusNode();

  TextTheme get textTheme => Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Blog"),
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
      key: _createCategoryFormKey,
      child: Container(
        margin: ScreenUtils.contentMargin,
        constraints: ScreenUtils.widthConstraints,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppTitleText(title: "Create Category"),
            AppCard(
                contentHeight: AppSize.s400,
                title: "Category",
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
                        textEditingController: nameTEC,
                        onChanged: onValueChanged,
                        labelText: "Name *",
                      ),
                    ),
                    Padding(
                        padding: ScreenUtils.formPadding,
                        child: DropdownButtonFormField(
                            isDense: true,
                            isExpanded: true,
                            value: _activate,
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: "Activated? *",
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
                            items: dv.activated
                                .map((e) => DropdownMenuItem(
                                    value: e["id"],
                                    child: Text(e["activate"].toString())))
                                .toList(),
                            onChanged: ((value) {
                              setState(() {
                                _activate = value as int;
                                activateTEC.text = _activate.toString();
                              });
                            }))),
                  ],
                )),
            buildTextEditor(),
            Container(
                margin: EdgeInsets.only(top: AppMargin.m20),
                child: AppElevatedButton(
                    onPressed: _isValidated ? onTapCreateCategory : () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add),
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
            child: const Text("Description"),
          ),
          const Divider(),
          HtmlEditor(
            controller: controller, //required

            htmlEditorOptions: const HtmlEditorOptions(
              shouldEnsureVisible: true,
              hint: "Input Category Description",
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
    _isValidated = _createCategoryFormKey.currentState?.validate() ?? false;
    setState(() {});
  }

  void onTapCreateCategory() async {
    CategoryBloc categoryBloc = BlocProvider.of<CategoryBloc>(context);
    NavigatorState navigatorState = Navigator.of(context);
    if (_isValidated) {
      final CategoryModel newCategory = CategoryModel(
          id: math.Random().nextInt(1000),
          description: await controller.getText(),
          activated: _activate,
          name: nameTEC.text);

      // Call PostBloc here

      categoryBloc.add(AddCategory(newCategory));
      // navigatorState.pop;
      navigatorState.pushNamedAndRemoveUntil(
          Routes.categoryScreen, ((route) => false));
    } else if (_isValidated == false) {
      ScaffoldMessengerState().showSnackBar(
          const SnackBar(content: Text("Please enter required fields")));
    }
  }
}
