
import 'package:flutter/material.dart';
import'package:udemy_course/presentaion/resources/color_manager.dart';
import 'package:udemy_course/presentaion/resources/font_manager.dart';
import 'package:udemy_course/presentaion/resources/style_manager.dart';
import 'package:udemy_course/presentaion/resources/values_manager.dart';
ThemeData getApplicationTheme(){
  return ThemeData(
  //maincolors
  primaryColor: ColorManager.primary,
  primaryColorLight: ColorManager.lightPrimary,
  primaryColorDark: ColorManager.darkpPrimary,
  disabledColor: ColorManager.grey1,

  //card view theme
  cardTheme: CardTheme(
    color: ColorManager.white,
    shadowColor: ColorManager.grey,
    elevation: AppSize.s4
  ),

  //app bar theme
appBarTheme:AppBarTheme(
  centerTitle: true,
  color: ColorManager.primary,
  elevation: AppSize.s4,
  shadowColor: ColorManager.lightPrimary,
  titleTextStyle: getRegularStyle(fontSize: FontSizeManager.S16,color: ColorManager.white)),

  //button theme
buttonTheme: ButtonThemeData(
  shape: const StadiumBorder(),
  disabledColor: ColorManager.grey1,
  buttonColor: ColorManager.primary,
  splashColor: ColorManager.lightPrimary,
),

//elevated button theme
elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom( 
    textStyle: getRegularStyle( 
      color: ColorManager.white,fontSize: FontSizeManager.S17),
      primary: ColorManager.primary,
      shape: RoundedRectangleBorder( 
        borderRadius: BorderRadius.circular(AppSize.s12)))),
//text theme 
textTheme: TextTheme( 
  displayLarge: getlightStyle(color: ColorManager.darkGrey, fontSize:FontSizeManager.S22),
  headlineLarge: getSemiBoldStyle(color: ColorManager.darkGrey,fontSize: FontSizeManager.S16),
  headlineMedium: getRegularStyle(color: ColorManager.darkGrey,fontSize: FontSizeManager.S14),
  titleMedium: getMeduimStyle(color: ColorManager.primary,fontSize: FontSizeManager.S16 ),
  bodyLarge: getRegularStyle(color: ColorManager.grey1 ),
  bodySmall: getRegularStyle(color: ColorManager.grey )),

//input decoration theme (text from feilds) 
inputDecorationTheme: InputDecorationTheme(
//content padding 
contentPadding: const EdgeInsets.all(AppPadding.p8),

//hint style
hintStyle: 
getRegularStyle(color: ColorManager.grey,fontSize: FontSizeManager.S14 ),
labelStyle: getMeduimStyle(color: ColorManager.grey , fontSize:  FontSizeManager.S14 ),
errorStyle: getRegularStyle(color: ColorManager.error ),

//enabeld border style
enabledBorder: OutlineInputBorder( 
  borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s1_5 ),
  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
//focused border style
focusedBorder: OutlineInputBorder(
  borderSide: BorderSide(color:ColorManager.primary, width: AppSize.s1_5 ),
  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
//error border style 
  errorBorder: OutlineInputBorder(
  borderSide: BorderSide(color:ColorManager.error, width: AppSize.s1_5 ),
  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
  //focused error border style 
  focusedErrorBorder: OutlineInputBorder(
  borderSide: BorderSide(color:ColorManager.error, width: AppSize.s1_5 ),
  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
//error
);

}