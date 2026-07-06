import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_responsive.dart';
import '../../../core/constant/app_text.dart';
import '../../../core/widget/gradient_button.dart';
import '../controller/role_selection_cont.dart';

class RoleSelectionScreen extends GetView<RoleSelectionController> {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppResponsive.r(10)),
              topRight: Radius.circular(AppResponsive.r(10)),
            ),
            child: Container(
              height: AppResponsive.h(255),
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFEBD9FF),
                    Color(0xFFFFFFFF),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: [
                  const _TopCircleBackground(),
                  Center(
                    child: Image.asset(
                      'assets/images/role_s.png',
                      height: AppResponsive.h(205),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: AppResponsive.h(50)),

          Text(
            'Choose Your Journey',
            textAlign: TextAlign.center,
            style: AppTextStyles.heading.copyWith(
              fontSize: AppResponsive.sp(27),
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: AppResponsive.h(18)),

          Text(
            'Select your role to unlock the right\nfeatures, tools, and opportunities with\nSnaapi.',
            textAlign: TextAlign.center,
            style: AppTextStyles.subHeading1.copyWith(
              fontSize: AppResponsive.sp(13),
              height: 1.22,
            ),
          ),

          SizedBox(height: AppResponsive.h(64)),

          _RoleButton(
            title: 'I’m a creator',
            role: 'creator',
            onTap: () => controller.selectRole('creator'),
          ),

          SizedBox(height: AppResponsive.h(21)),

          _RoleButton(
            title: 'I’m a Brand',
            role: 'brand',
            onTap: () => controller.selectRole('brand'),
          ),

          SizedBox(height: AppResponsive.h(21)),

          _RoleButton(
            title: 'I’m a Agency',
            role: 'agency',
            onTap: () => controller.selectRole('agency'),
          ),
        ],
      ),
    );
  }
}

class _RoleButton extends GetView<RoleSelectionController> {
  final String title;
  final String role;
  final VoidCallback onTap;

  const _RoleButton({
    required this.title,
    required this.role,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selected = controller.isSelected(role);

      return GradientButton(
        label: title,
        isOutlined: !selected,
        height: AppResponsive.h(49),
        width: AppResponsive.w(255),
        onTap: onTap,
      );
    });
  }
}

class _TopCircleBackground extends StatelessWidget {
  const _TopCircleBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        double.infinity,
        AppResponsive.h(255),
      ),
      painter: _TopCirclePainter(),
    );
  }
}

class _TopCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = AppResponsive.w(1)
      ..color = AppColors.primaryLight.withValues(alpha: 0.30);

    canvas.drawCircle(
      Offset(AppResponsive.w(30), AppResponsive.h(88)),
      AppResponsive.r(68),
      circlePaint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.35, -AppResponsive.h(42)),
      AppResponsive.r(78),
      circlePaint,
    );

    canvas.drawCircle(
      Offset(size.width - AppResponsive.w(28), AppResponsive.h(30)),
      AppResponsive.r(86),
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}