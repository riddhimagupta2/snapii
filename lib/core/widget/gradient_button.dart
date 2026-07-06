import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../constant/app_responsive.dart';
import '../constant/app_text.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final bool isOutlined;

  const GradientButton({
    super.key,
    required this.label,
    this.onTap,
    this.width,
    this.height,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(
      AppResponsive.r(28),
    );

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Ink(
          width: width ?? double.infinity,
          height: height ?? AppResponsive.h(52),
          decoration: BoxDecoration(
            color: isOutlined ? AppColors.white : null,
            gradient: isOutlined ? null : AppColors.primaryGradient,
            borderRadius: borderRadius,
            border: isOutlined
                ? Border.all(
              color: AppColors.greyLight,
              width: 1.2,
            )
                : null,
            boxShadow: null,
          ),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: isOutlined
                  ? AppTextStyles.buttonSecondary.copyWith(
                fontSize: AppResponsive.sp(15),
              )
                  : AppTextStyles.buttonPrimary.copyWith(
                fontSize: AppResponsive.sp(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}