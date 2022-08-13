import 'dart:async';
import 'package:udemy_course/presentaion/base/baseviewmodel.dart';
import '../../../domain/models/models.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';
import 'package:udemy_course/domain/models/models.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  late final List<SliderObject> _list;
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  int _currenIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    //call user API

    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currenIndex;

    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevios() {
    int previousIndex = --_currenIndex;

    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currenIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // ignore: non_constant_identifier_names
  Stream<SliderViewObject> get OutputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

//onboarding private functions

  void _postDataToView() {
    inputSliderViewObject
        .add(SliderViewObject(_list[_currenIndex], _list.length, _currenIndex));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(AppString.OnboardingTitle1, AppString.OnboardingSubTitle1,
            ImageAssets.onBordingSvgLogo1),
        SliderObject(AppString.OnboardingTitle2, AppString.OnboardingSupTitle2,
            ImageAssets.onBordingSvgLogo2),
        SliderObject(AppString.OnboardingTitle3, AppString.OnboardingSupTitle3,
            ImageAssets.onBordingSvgLogo3),
        SliderObject(AppString.OnboardingTitle4, AppString.OnboardingSupTitle4,
            ImageAssets.onBordingSvgLogo4),
      ];
}

abstract class OnboardingViewModelInputs {
  int goNext(); //when user clicks on right arrow or swipes left
  int goPrevios(); // when user clicks on left arrow or swipes right
  void onPageChanged(int index);
  Sink get inputSliderViewObject;
}

abstract class OnboardingViewModelOutputs {
  // ignore: non_constant_identifier_names
  Stream<SliderViewObject> get OutputSliderViewObject;
}
