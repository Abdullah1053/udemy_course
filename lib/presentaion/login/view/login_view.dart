import 'package:flutter/material.dart';
import 'package:udemy_course/presentaion/login/view_model/login_viewmodel.dart';
import 'package:udemy_course/presentaion/resources/assets_manager.dart';
import 'package:udemy_course/presentaion/resources/color_manager.dart';
import 'package:udemy_course/presentaion/resources/strings_manager.dart';
import 'package:udemy_course/presentaion/resources/values_manager.dart';

import '../../resources/routes_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = LoginViewModel();
  final TextEditingController _userNameStreamController =
      TextEditingController();
  final TextEditingController _passwordStreamController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  _blind() {
    _viewModel.start(); // to tell _viewmodel to start
    _userNameStreamController.addListener(
        () => _viewModel.setUserName(_userNameStreamController.text));
    _passwordStreamController.addListener(
        () => _viewModel.setUserName(_passwordStreamController.text));
  }

  @override
  void initState() {
    _blind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              //usermame settings
              const Center(
                  child: Image(image: AssetImage(ImageAssets.splashLogo))),
              const SizedBox(height: AppSize.s25),
              Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outIsUserNameValid,
                    builder: ((context, snapshot) {
                      print(_viewModel.outIsUserNameValid);
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _userNameStreamController,
                        decoration: InputDecoration(
                            hintText: AppString.username,
                            labelText: AppString.username,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppString.usernameError),
                      );
                    }),
                  )),
              //password setting
              const SizedBox(height: AppSize.s25),
              Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outIsUserNameValid,
                    builder: ((context, snapshot) {
                      print(_viewModel.outIsUserNameValid);
                      return TextFormField(
                        key: _formKey,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordStreamController,
                        decoration: InputDecoration(
                            hintText: AppString.password,
                            labelText: AppString.password,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppString.passwordError),
                      );
                    }),
                  )),
              const SizedBox(
                height: AppSize.s25,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outIsUserNameValid,
                    builder: ((context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: ElevatedButton(
                            onPressed: (snapshot.data ?? false)
                                ? () {
                                    _viewModel.login();
                                  }
                                : null,
                            child: const Text(AppString.login)),
                      );
                    }),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: AppPadding.p8,
                      left: AppPadding.p28,
                      right: AppPadding.p28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.forgotPasswordRoute);
                        },
                        child: Text(
                          AppString.forgotPassword,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.registerRoute);
                          },
                          child: Text(
                            AppString.registerText,
                            style: Theme.of(context).textTheme.titleMedium,
                          ))
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
