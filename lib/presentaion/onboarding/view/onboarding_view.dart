// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udemy_course/presentaion/resources/color_manager.dart';
import 'package:udemy_course/presentaion/resources/routes_manager.dart';
import 'package:udemy_course/presentaion/resources/strings_manager.dart';
import 'package:udemy_course/presentaion/resources/assets_manager.dart';
import 'package:udemy_course/presentaion/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_course/presentaion/resources/constants_manager.dart';
import 'package:udemy_course/presentaion/onboarding/viewmodel/onboarding_viewmodel.dart';
import '../../../domain/models/models.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.OutputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject!.numOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
              child: Text(
                AppString.Skip,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          _getBottomSheetWidget(sliderViewObject)
        ]),
      ),
    );
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
        color: ColorManager.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, //to make space between diffrent buttons and/or icons
          children: [
            //left arrow
            Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.onBordingLeft),
                ),
                onTap: () {
                  _pageController.animateToPage(_viewModel.goPrevios(),
                      duration: const Duration(
                          microseconds: Constants.SliderAnimation),
                      curve: Curves.bounceInOut);
                } // go to previos slides
                ,
              ),
            ),

//Circule

            Row(
              children: [
                for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: _getProperCircule(i, sliderViewObject.currentIndexs),
                  )
              ],
            ),

            //Right Arrow
            Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.onBordingRight),
                ),
                onTap: () {
                  _pageController.animateToPage(_viewModel.goNext(),
                      duration: const Duration(
                          microseconds: Constants.SliderAnimation),
                      curve: Curves.bounceInOut);
                } // go to previos slides
                ,
              ),
            ),
          ],
        ));
  }

  Widget _getProperCircule(int index, int currentIndexs) {
    if (index == currentIndexs) {
      return SvgPicture.asset(ImageAssets.onBordingSolid);
    } else {
      return SvgPicture.asset(ImageAssets.onBordingHolo);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}
