import 'package:flutter/material.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/app_responsive.dart';

class AuthTopBackground extends StatelessWidget {
  const AuthTopBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(AppResponsive.screenWidth, AppResponsive.h(160)),
      painter: _AuthTopPainter(),
    );
  }
}

class _AuthTopPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFF1E4FF),
          AppColors.white,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    final circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = AppColors.primaryLight.withValues(alpha: 0.35);

    canvas.drawCircle(
      Offset(AppResponsive.w(45), AppResponsive.h(-18)),
      AppResponsive.r(75),
      circlePaint,
    );

    canvas.drawCircle(
      Offset(size.width - AppResponsive.w(45), AppResponsive.h(-20)),
      AppResponsive.r(75),
      circlePaint,
    );

    canvas.drawCircle(
      Offset(AppResponsive.w(-25), AppResponsive.h(55)),
      AppResponsive.r(70),
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}