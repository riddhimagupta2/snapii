import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../constant/app_responsive.dart';

class RadioDot extends StatelessWidget {
  final bool selected;
  const RadioDot({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppResponsive.w(20),
      height: AppResponsive.w(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? AppColors.primary : AppColors.greyBorder,
          width: 1.4,
        ),
        color: selected ? AppColors.primary : Colors.transparent,
      ),
      child: selected
          ? Icon(Icons.check, size: AppResponsive.sp(13), color: AppColors.white)
          : null,
    );
  }
}