import 'dart:ui';

import 'package:flutter/material.dart';

class TextStyleUtils {
  static TextStyle merge(
    TextStyle textStyle, {
    bool inherit,
    Color color,
    Color backgroundColor,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    double letterSpacing,
    double wordSpacing,
    TextBaseline textBaseline,
    double height,
    Locale locale,
    Paint foreground,
    Paint background,
    List<Shadow> shadows,
    List<FontFeature> fontFeatures,
    TextDecoration decoration,
    Color decorationColor,
    TextDecorationStyle decorationStyle,
    double decorationThickness,
    String debugLabel,
    String fontFamily,
    List<String> fontFamilyFallback,
  }) {
    return TextStyle(
      inherit: inherit == null ? textStyle.inherit : inherit,
      color: color == null ? textStyle.color : color,
      backgroundColor:
          backgroundColor == null ? textStyle.backgroundColor : backgroundColor,
      fontSize: fontSize == null ? textStyle.fontSize : fontSize,
      fontWeight: fontWeight == null ? textStyle.fontWeight : fontWeight,
      fontStyle: fontStyle == null ? textStyle.fontStyle : fontStyle,
      letterSpacing:
          letterSpacing == null ? textStyle.letterSpacing : letterSpacing,
      wordSpacing: wordSpacing == null ? textStyle.wordSpacing : wordSpacing,
      textBaseline:
          textBaseline == null ? textStyle.textBaseline : textBaseline,
      height: height == null ? textStyle.height : height,
      locale: locale == null ? textStyle.locale : locale,
      foreground: foreground == null ? textStyle.foreground : foreground,
      background: background == null ? textStyle.background : background,
      shadows: shadows == null ? textStyle.shadows : shadows,
      fontFeatures:
          fontFeatures == null ? textStyle.fontFeatures : fontFeatures,
      decoration: decoration == null ? textStyle.decoration : decoration,
      decorationColor:
          decorationColor == null ? textStyle.decorationColor : decorationColor,
      decorationStyle:
          decorationStyle == null ? textStyle.decorationStyle : decorationStyle,
      decorationThickness: decorationThickness == null
          ? textStyle.decorationThickness
          : decorationThickness,
      debugLabel: debugLabel == null ? textStyle.debugLabel : debugLabel,
      fontFamily: fontFamily == null ? textStyle.fontFamily : fontFamily,
      fontFamilyFallback: fontFamilyFallback == null
          ? textStyle.fontFamilyFallback
          : fontFamilyFallback,
    );
  }
}
