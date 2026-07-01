import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_colors.dart';
import '../constant/app_responsive.dart';
import '../constant/app_text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;

  const AppBarWidget({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
      titleSpacing: 0,
      leading: IconButton(
        onPressed: onBack ?? () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: AppResponsive.sp(18),
          color: AppColors.primaryLight,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.heading.copyWith(
          color: AppColors.primaryLight,
          fontSize: AppResponsive.sp(16),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}