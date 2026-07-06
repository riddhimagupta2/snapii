import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_responsive.dart';
import '../../feature/brand/navigation/controller/brand_navigation_controller.dart';

class CustomBottomNav extends GetView<BrandNavigationController> {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          AppResponsive.w(22),
          0,
          AppResponsive.w(22),
          AppResponsive.h(12),
        ),
        child: Container(
          height: AppResponsive.h(58),
          padding: EdgeInsets.symmetric(
            horizontal: AppResponsive.w(18),
          ),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(
              AppResponsive.r(32),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(
                  alpha: 0.28,
                ),
                blurRadius: AppResponsive.r(18),
                offset: Offset(
                  0,
                  AppResponsive.h(8),
                ),
              ),
            ],
          ),
          child: Obx(
                () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _NavigationItem(
                  icon: Icons.home_rounded,
                  index: 0,
                ),
                _NavigationItem(
                  icon: Icons.campaign_rounded,
                  index: 1,
                ),
                _NavigationItem(
                  icon: Icons.smart_toy_rounded,
                  index: 2,
                ),
                _NavigationItem(
                  icon: Icons.chat_bubble_rounded,
                  index: 3,
                ),
                _NavigationItem(
                  icon: Icons.person_rounded,
                  index: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavigationItem extends GetView<BrandNavigationController> {
  final IconData icon;
  final int index;

  const _NavigationItem({
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = controller.isSelected(index);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => controller.changeTab(index),
      child: SizedBox(
        width: AppResponsive.w(42),
        height: AppResponsive.h(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.white,
              size: AppResponsive.sp(
                isSelected ? 25 : 22,
              ),
            ),
            SizedBox(
              height: AppResponsive.h(3),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: isSelected
                  ? AppResponsive.w(24)
                  : 0,
              height: AppResponsive.h(2.5),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(
                  AppResponsive.r(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}