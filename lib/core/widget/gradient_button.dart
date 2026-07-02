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
    return InkWell(
      borderRadius: BorderRadius.circular(AppResponsive.r(28)),
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? AppResponsive.h(52),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isOutlined ? AppColors.white : null,
          gradient: isOutlined ? null : AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(AppResponsive.r(28)),
          border: isOutlined
              ? Border.all(
            color: AppColors.greyLight,
            width: 1.2,
          )
              : null,
          boxShadow: isOutlined
              ? null
              : [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.35),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Text(
          label,
          style: isOutlined
              ? AppTextStyles.buttonSecondary.copyWith(
            fontSize: AppResponsive.sp(15),
          )
              : AppTextStyles.buttonPrimary.copyWith(
            fontSize: AppResponsive.sp(15),
          ),
        ),
      ),
    );
  }
}