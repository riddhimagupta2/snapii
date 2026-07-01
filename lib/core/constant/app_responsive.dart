import 'package:flutter/material.dart';

class AppResponsive {

  static const double _designWidth = 351.0;
  static const double _designHeight = 780.0;

  static late double _width;
  static late double _height;
  static late double _statusBarHeight;
  static late double _bottomInset;
  static late Orientation _orientation;

  static void init(BuildContext context) {
    final mq = MediaQuery.of(context);
    _width = mq.size.width;
    _height = mq.size.height;
    _statusBarHeight = mq.padding.top;
    _bottomInset = mq.padding.bottom;
    _orientation = mq.orientation;
  }

  static double get screenWidth => _width;
  static double get screenHeight => _height;
  static double get statusBarHeight => _statusBarHeight;
  static double get bottomInset => _bottomInset;
  static bool get isPortrait => _orientation == Orientation.portrait;
  static bool get isTablet => _width >= 600;

  static double w(double designPx) => (designPx / _designWidth) * _width;

  static double h(double designPx) => (designPx / _designHeight) * _height;

  static double sp(double designPx) {
    final scaled = (designPx / _designWidth) * _width;
    final minSize = designPx * 0.85;
    final maxSize = designPx * 1.25;
    return scaled.clamp(minSize, maxSize);
  }

  static double r(double designPx) => w(designPx);
}
