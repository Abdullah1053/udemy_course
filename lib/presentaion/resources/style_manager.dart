
import 'dart:ui';

import'package:flutter/material.dart';
import'package:udemy_course/presentaion/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWright,Color color){
  return TextStyle(
    fontSize:fontSize,
    fontFamily:FontConstants.fontFamily,
    color: color,
    fontWeight: FontWright);
  
}


//regular size
TextStyle getRegularStyle(
  {double fontSize = FontSizeManager.S12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.regular, color);
  }

//BOLD STYLE
TextStyle getBoldStyle(
  {double fontSize = FontSizeManager.S12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.bold, color);
  }

//medium size
TextStyle getMeduimStyle(
  {double fontSize = FontSizeManager.S12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.meduim, color);
  }
//light size
TextStyle getlightStyle(
  {double fontSize = FontSizeManager.S12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.light, color);
  }
//semiBold size
TextStyle getSemiBoldStyle(
  {double fontSize = FontSizeManager.S12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
  }
