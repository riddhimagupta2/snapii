import 'package:flutter/material.dart';
import '../constant/app_colors.dart';
import '../constant/app_responsive.dart';
import '../constant/app_text.dart';
import 'outline_button.dart';

class TriggerOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool selected;
  final bool popular;
  final VoidCallback onTap;

  const TriggerOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
    this.popular = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppResponsive.r(16)),
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: AppResponsive.w(14),
              vertical: AppResponsive.h(14),
            ),
            decoration: BoxDecoration(
              color: selected ? AppColors.primarySelectedBg : AppColors.white,
              borderRadius: BorderRadius.circular(AppResponsive.r(16)),
              border: Border.all(
                color: selected ? AppColors.primary : AppColors.greyLight,
                width: selected ? 1.4 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: AppResponsive.w(38),
                  height: AppResponsive.w(38),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(AppResponsive.r(10)),
                  ),
                  child: Icon(icon, color: AppColors.primary, size: AppResponsive.sp(20)),
                ),
                SizedBox(width: AppResponsive.w(12)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppTextStyles.cardTitle.copyWith(fontSize: AppResponsive.sp(14.5))),
                      SizedBox(height: AppResponsive.h(3)),
                      Text(subtitle, style: AppTextStyles.cardSubtitle.copyWith(fontSize: AppResponsive.sp(12))),
                    ],
                  ),
                ),
                SizedBox(width: AppResponsive.w(8)),
                RadioDot(selected: selected),
              ],
            ),
          ),
          if (popular)
            Positioned(
              top: -AppResponsive.h(8),
              right: AppResponsive.w(14),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(8), vertical: AppResponsive.h(3)),
                decoration: BoxDecoration(
                  color: AppColors.popularBadge,
                  borderRadius: BorderRadius.circular(AppResponsive.r(6)),
                ),
                child: Text('POPULAR', style: AppTextStyles.badge.copyWith(fontSize: AppResponsive.sp(9), color: AppColors.black)),
              ),
            ),
        ],
      ),
    );
  }
}