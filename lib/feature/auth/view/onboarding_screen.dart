import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_responsive.dart';
import '../../../core/constant/app_text.dart';
import '../../../core/widget/gradient_button.dart';
import '../controller/onboarding_cont.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const _OnboardingBackground(),

          SafeArea(
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.pages.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (context, index) {
                final item = controller.pages[index];

                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppResponsive.w(28),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: AppResponsive.h(145)),

                      SizedBox(
                        height: AppResponsive.h(135),
                        width: AppResponsive.w(170),
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(height: AppResponsive.h(28)),

                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.heading.copyWith(
                          fontSize: AppResponsive.sp(21),
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      SizedBox(height: AppResponsive.h(12)),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppResponsive.w(20),
                        ),
                        child: Text(
                          item.description,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.subHeading.copyWith(
                            fontSize: AppResponsive.sp(14),
                            height: 1.35,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: AppResponsive.h(200),
            child: Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.pages.length,
                      (index) {
                    final isSelected = controller.currentIndex.value == index;

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: EdgeInsets.symmetric(
                        horizontal: AppResponsive.w(3),
                      ),
                      width: AppResponsive.w(6),
                      height: AppResponsive.h(6),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.primary.withValues(alpha: 0.25),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          Positioned(
            left: AppResponsive.w(24),
            right: AppResponsive.w(24),
            bottom: AppResponsive.h(32),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: GradientButton(
                      label: 'Skip',
                      height: AppResponsive.h(38),
                      isOutlined: true,
                      onTap: controller.skip,
                    ),
                  ),

                  SizedBox(width: AppResponsive.w(38)),

                  Expanded(
                    child: Obx(
                          () => GradientButton(
                        label: controller.isLastPage ? 'Get Started' : 'Next',
                        height: AppResponsive.h(38),
                        onTap: controller.nextPage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingBackground extends StatelessWidget {
  const _OnboardingBackground();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: CustomPaint(
        size: Size(
          AppResponsive.screenWidth,
          AppResponsive.h(185),
        ),
        painter: _OnboardingBackgroundPainter(),
      ),
    );
  }
}

class _OnboardingBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFF2EAFE),
          AppColors.white,
        ],
      ).createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      backgroundPaint,
    );

    final circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = AppResponsive.w(1)
      ..color = AppColors.primaryLight.withValues(alpha: 0.35);

    canvas.drawCircle(
      Offset(AppResponsive.w(30), AppResponsive.h(55)),
      AppResponsive.r(70),
      circlePaint,
    );

    canvas.drawCircle(
      Offset(size.width - AppResponsive.w(20), AppResponsive.h(20)),
      AppResponsive.r(85),
      circlePaint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.5, -AppResponsive.h(35)),
      AppResponsive.r(65),
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _OnboardingBackgroundPainter oldDelegate) {
    return false;
  }
}