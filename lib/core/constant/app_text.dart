import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle _inter({
    required double size,
    required FontWeight weight,
    Color color = AppColors.black,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.inter(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle appBarTitle = _inter(size: 16, weight: FontWeight.w600);

  static TextStyle heading = _inter(size: 20, weight: FontWeight.w700);

  static TextStyle subHeading = _inter(
    size: 13,
    weight: FontWeight.w400,
    color: AppColors.greyText,
    height: 1.4,
  );

  static TextStyle cardTitle = _inter(size: 14.5, weight: FontWeight.w600);

  static TextStyle cardSubtitle = _inter(
    size: 12,
    weight: FontWeight.w400,
    color: AppColors.greyText,
    height: 1.3,
  );

  static TextStyle fieldLabel = _inter(size: 13, weight: FontWeight.w400);

  static TextStyle inputText = _inter(size: 13.5, weight: FontWeight.w400);
  static TextStyle inputHint = _inter(
    size: 13.5,
    weight: FontWeight.w400,
    color: AppColors.greyBorder,
  );

  static TextStyle buttonPrimary = _inter(
    size: 15,
    weight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle buttonSecondary = _inter(
    size: 15,
    weight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle badge = _inter(
    size: 9,
    weight: FontWeight.w700,
    color: AppColors.white,
    letterSpacing: 0.3,
  );

  static TextStyle stepLabel = _inter(
    size: 11.5,
    weight: FontWeight.w500,
    color: AppColors.greyText,
  );

  static TextStyle chatBubble = _inter(
    size: 11.5,
    weight: FontWeight.w400,
    height: 1.3,
  );

  static TextStyle caption = _inter(
    size: 11,
    weight: FontWeight.w400,
    color: AppColors.greyText,
  );
}
