import 'package:Blog_web/bloc/auth/auth_bloc.dart';
import 'package:Blog_web/theme/theme.dart';
import 'package:Blog_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:Blog_web/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();

  bool _isValidated = false;
  final bool _obscureText = true;

  TextTheme get textTheme => Theme.of(context).textTheme;
  List<Widget> get signInFields => [
        const Text("Log in with your Username and Password"),
        Text(
          "Demo Username & Password: admin",
          style: getRegularStyle(),
        ),
        AppTextFormField(
          validator: FormValidators.validateName,
          onChanged: onChanged,
          textInputAction: TextInputAction.next,
          textEditingController: _usernameTEC,
          labelText: "Username",
        ),
        SizedBox(
          height: AppMargin.m30,
        ),
        AppTextFormField(
          // validator: FormValidators.validatePhoneNumber,
          onChanged: onChanged,
          obscureText: _obscureText,
          textInputAction: TextInputAction.done,
          isNumber: true,
          textEditingController: _passwordTEC,
          labelText: "Password",
        )
      ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Blog Admin')),
        body: BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthLoading) {
            return const ShowLoading();
          } else {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                    AppColors.gradient1,
                    AppColors.gradient2
                  ])),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppPadding.p20),
                        child: Text(
                          'Login Page',
                          style: textTheme.headlineLarge,
                        ),
                      ),
                      buildMainContent(),
                    ],
                  ),
                ),
              ),
            );
          }
        }, listener: ((context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Please enter username/password!'),
            ));
          } else if (state is AuthLoaded) {
            clearTextData();
            Navigator.pushReplacementNamed(
              context,
              Routes.mainScreen,
            );
          }
        })));
  }

  Widget buildMainContent() {
    return Card(
      margin: EdgeInsets.symmetric(
          vertical: AppMargin.m20, horizontal: AppMargin.m30),
      child: Form(
        key: _signInFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20, vertical: AppPadding.p20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...signInFields,
              SizedBox(
                height: AppMargin.m30,
              ),
              AppElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context)
                        .add(Login(_usernameTEC.text, _passwordTEC.text));
                  },
                  child: Text('Log In'))
            ],
          ),
        ),
      ),
    );
  }

  void onChanged(String? value) {
    _isValidated = _signInFormKey.currentState?.validate() ?? false;
    setState(() {});
  }

  clearTextData() {
    _usernameTEC.clear();
    _passwordTEC.clear();
  }
}
