import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  static const Color greyLight = Color(0xFFE5E5E5);
  static const Color greyMid = Color(0xFFDEDEDE);
  static const Color greyText = Color(0xFF7E7B7B);
  static const Color greyBorder = Color(0xFFB9B9B9);
  static const Color greyFieldBg = Color(0xFFF5F5F7);

  static const Color primary = Color(0xFFA774FF);
  static const Color primaryLight = Color(0xFFBB93FF);
  static const Color primarySelectedBg = Color(0x1FA774FF);
  static const Color primaryFaded44 = Color(0x70A774FF);

  static const Color popularBadge = Color(0xFFFFCD29);

  static const Color whiteOverlay77 = Color(0xC4FFFFFF);
  static const Color whiteOverlay59 = Color(0x96FFFFFF);
  static const Color whiteOverlay55 = Color(0x8CFFFFFF);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFBB93FF), Color(0xFF5765FF)],
  );

  static const LinearGradient screenBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF7F5FB), white],
  );

  static const RadialGradient robotGlowGradient = RadialGradient(
    colors: [primaryLight, Colors.transparent],
    radius: 0.8,
  );

  static const Color scaffoldBg = white;
  static const Color cardBg = white;
}
