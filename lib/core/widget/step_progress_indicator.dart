import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../constant/app_responsive.dart';
import '../constant/app_text.dart';

class StepProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgressBar({
    super.key,
    required this.currentStep,
    this.totalSteps = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step $currentStep Of $totalSteps',
          style: AppTextStyles.stepLabel.copyWith(
            fontSize: AppResponsive.sp(12),
            fontWeight: FontWeight.w500,
            color: const Color(0xFFA774FF),
          ),
        ),
        SizedBox(height: AppResponsive.h(4)),
        SizedBox(
          height: AppResponsive.h(18),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: AppResponsive.w(9),
                right: AppResponsive.w(9),
                child: Container(
                  height: AppResponsive.h(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8C1FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(totalSteps, (index) {
                  final step = index + 1;
                  final active = step <= currentStep;

                  return Container(
                    width: AppResponsive.w(18),
                    height: AppResponsive.w(18),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: active
                          ? const Color(0xFFA774FF)
                          : AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFD8C1FF),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      '$step',
                      style: AppTextStyles.caption.copyWith(
                        fontSize: AppResponsive.sp(9),
                        color: active
                            ? AppColors.white
                            : const Color(0xFFA774FF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}