import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ScreenUtils {
  static Size _screenSize = const Size(0, 0);
  static Size screenSize = _screenSize;
  static void setScreenSize(Size value) {
    _screenSize = value;
    _screenHeight = value.height;
    _screenWidth = value.width;
  }

  static double ratio = (_screenHeight / _screenWidth);
  static double scaleValue(double value) {
    return ratio * value;
  }

  static double _screenHeight = 0;
  static double get screenHeight => _screenHeight;

  static double _screenWidth = 0;
  static double get screenWidth => _screenWidth;

  static BoxConstraints get widthConstraints =>
      const BoxConstraints(minWidth: AppSize.s600, maxWidth: AppSize.s1200);

  static EdgeInsets get contentMargin =>
      EdgeInsets.symmetric(vertical: AppMargin.m50, horizontal: AppMargin.m30);
}
