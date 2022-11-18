library universal_ui;

import 'dart:developer';
import 'dart:math' as math;

import 'package:Blog_web/bloc/bloc.dart';
import 'package:Blog_web/models/models.dart';
import 'package:Blog_web/utils/utils.dart';
import 'package:Blog_web/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:Blog_web/utils/src/dropdown_values.dart' as dv;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/theme.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final GlobalKey<FormState> _createUserFormKey = GlobalKey<FormState>();
  TextEditingController fullNameTEC = TextEditingController();
  TextEditingController usernameTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController membershipTEC = TextEditingController();

  MemberStatus _member = MemberStatus.normal;
  bool _isValidated = false;

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
    return Container(
      margin: ScreenUtils.contentMargin,
      constraints: ScreenUtils.widthConstraints,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppTitleText(title: "Create Users"),
          Form(
            key: _createUserFormKey,
            child: AppCard(
                // contentHeight: AppSize.s400,
                title: "User",
                actionList: [
                  AppElevatedButton(
                      onPressed: _isValidated ? onTapCreateUser : () {},
                      child: const Icon(Icons.group_add_sharp))
                ],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: ScreenUtils.formPadding,
                      child: AppTextFormField(
                        textEditingController: fullNameTEC,
                        validator: FormValidators.validateName,
                        onChanged: onValueChanged,
                        labelText: "Full Name *",
                      ),
                    ),
                    Padding(
                      padding: ScreenUtils.formPadding,
                      child: AppTextFormField(
                        textEditingController: usernameTEC,
                        validator: FormValidators.validateName,
                        onChanged: onValueChanged,
                        labelText: "Username *",
                      ),
                    ),
                    Padding(
                      padding: ScreenUtils.formPadding,
                      child: AppTextFormField(
                        textEditingController: emailTEC,
                        validator: FormValidators.validateEmail,
                        onChanged: onValueChanged,
                        labelText: "Email *",
                      ),
                    ),
                    Padding(
                      padding: ScreenUtils.formPadding,
                      child: AppTextFormField(
                        textEditingController: passwordTEC,
                        validator: FormValidators.validatePassword,
                        onChanged: onValueChanged,
                        labelText: "Password *",
                      ),
                    ),
                    Padding(
                        padding: ScreenUtils.formPadding,
                        child: DropdownButtonFormField(
                            isDense: true,
                            isExpanded: true,
                            value: _member,
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: "Membership *",
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
                                _member = value as MemberStatus;
                                membershipTEC.text = _member.toString();
                              });
                            })))
                  ],
                )),
          ),
          Container(
              margin: EdgeInsets.only(top: AppMargin.m20),
              child: AppElevatedButton(
                  onPressed: _isValidated ? onTapCreateUser : () {},
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
    );
  }

  void onValueChanged(String? value) {
    _isValidated = _createUserFormKey.currentState?.validate() ?? false;
    setState(() {});
  }

  void onTapCreateUser() {
    if (_isValidated) {
      final UserModel newUser = UserModel(
          id: math.Random().nextInt(1000),
          fullName: fullNameTEC.text,
          username: usernameTEC.text,
          password: passwordTEC.text,
          email: emailTEC.text,
          membership: _member);

      // Call UserBloc here

      BlocProvider.of<UserBloc>(context).add(AddUser(newUser));
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.mainScreen, ((route) => false));

      log("User Added: ${StagingUser.userList.toString()}");
    } else if (_isValidated == false) {
      ScaffoldMessengerState().showSnackBar(
          const SnackBar(content: Text("Please enter required fields")));
    }
  }
}
