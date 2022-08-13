import 'dart:async';
import 'package:flutter/material.dart';
import 'package:udemy_course/presentaion/resources/color_manager.dart';
import 'package:udemy_course/presentaion/resources/assets_manager.dart';
import 'package:udemy_course/presentaion/resources/routes_manager.dart';
import 'package:udemy_course/presentaion/resources/constants_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: Constants.SplashDelay), _getNext);
  }

  _getNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      // ignore: prefer_const_constructors
      body: Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
