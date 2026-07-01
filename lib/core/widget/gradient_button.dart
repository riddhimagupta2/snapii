import 'package:flutter/material.dart';
import '../constant/app_colors.dart';
import '../constant/app_responsive.dart';
import '../constant/app_text.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final double? width;

  const GradientButton({
    super.key,
    required this.label,
    this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppResponsive.r(28)),
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: AppResponsive.h(52),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(AppResponsive.r(28)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.35),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Text(
          label,
          style: AppTextStyles.buttonPrimary.copyWith(
            fontSize: AppResponsive.sp(15),
          ),
        ),
      ),
    );
  }
}

/// The outlined "Back" button that sits next to [GradientButton].
class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const SecondaryButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppResponsive.r(28)),
      onTap: onTap,
      child: Container(
        width: AppResponsive.w(100),
        height: AppResponsive.h(52),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppResponsive.r(28)),
          border: Border.all(color: AppColors.greyLight, width: 1.2),
        ),
        child: Text(
          label,
          style: AppTextStyles.buttonSecondary.copyWith(
            fontSize: AppResponsive.sp(15),
          ),
        ),
      ),
    );
  }
}