import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_responsive.dart';
import '../../../../core/constant/app_text.dart';
import '../../../../core/constant/routes/app_routes.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/gradient_button.dart';


class LiveAutomationPreviewScreen extends StatelessWidget {
  const LiveAutomationPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(title: 'Smart Auto DM'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(18)),
                child: Column(
                  children: [
                    Text(
                      'Live Automations Preview',
                      style: AppTextStyles.fieldLabel.copyWith(
                        fontSize: AppResponsive.sp(14),
                        color: AppColors.greyText,
                      ),
                    ),

                    SizedBox(height: AppResponsive.h(12)),

                    const _ChatPreviewCard(),

                    SizedBox(height: AppResponsive.h(18)),

                    Text(
                      'Automate conversations. Grow effortlessly.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.cardTitle.copyWith(
                        fontSize: AppResponsive.sp(13),
                      ),
                    ),

                    SizedBox(height: AppResponsive.h(15)),

                    const _CreateAutomationCardContent(),

                    SizedBox(height: AppResponsive.h(28)),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                bottom: AppResponsive.h(24),
                top: AppResponsive.h(10),
              ),
              child: Center(
                child: SizedBox(
                  width: AppResponsive.w(250),
                  height: AppResponsive.h(46),
                  child: GradientButton(
                    label: 'Create Automation',
                    onTap: () => Get.toNamed(AppRoutes.triggerType),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatPreviewCard extends StatelessWidget {
  const _ChatPreviewCard();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bubbleWidth = constraints.maxWidth * 0.78;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppResponsive.w(14)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppResponsive.r(30)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(.55),
                const Color(0xFFF7F2FF).withOpacity(.55),
              ],
            ),
            border: Border.all(color: const Color(0xFFA774FF).withOpacity(.44)),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: bubbleWidth,
                  child: Container(
                    padding: EdgeInsets.all(AppResponsive.w(14)),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppResponsive.r(12)),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hey there! I'm so happy you're here, thanks so much for your interest 😊\n\nClick below and I'll send you the link in just a sec",
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.visible,
                          style: AppTextStyles.chatBubble.copyWith(
                            fontSize: AppResponsive.sp(12),
                            color: AppColors.black,
                            height: 1.35,
                          ),
                        ),
                        SizedBox(height: AppResponsive.h(9)),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            vertical: AppResponsive.h(10),
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8E8EC),
                            borderRadius: BorderRadius.circular(
                              AppResponsive.r(8),
                            ),
                          ),
                          child: Text(
                            'Send me the link',
                            style: AppTextStyles.buttonSecondary.copyWith(
                              fontSize: AppResponsive.sp(12),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppResponsive.h(10)),

              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppResponsive.w(16),
                    vertical: AppResponsive.h(11),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA774FF),
                    borderRadius: BorderRadius.circular(AppResponsive.r(12)),
                  ),
                  child: Text(
                    'Send me the link',
                    style: AppTextStyles.chatBubble.copyWith(
                      fontSize: AppResponsive.sp(12),
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppResponsive.h(5)),

              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppResponsive.w(22),
                    vertical: AppResponsive.h(12),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppResponsive.r(12)),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(
                    '@label_wildchild',
                    style: AppTextStyles.chatBubble.copyWith(
                      fontSize: AppResponsive.sp(12),
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppResponsive.h(10)),

              Container(
                height: AppResponsive.h(52),
                padding: EdgeInsets.only(
                  left: AppResponsive.w(18),
                  right: AppResponsive.w(6),
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppResponsive.r(28)),
                  border: Border.all(
                    color: const Color(0xFFA774FF).withOpacity(.44),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Message...',
                        style: AppTextStyles.inputHint.copyWith(
                          fontSize: AppResponsive.sp(13),
                        ),
                      ),
                    ),
                    Container(
                      width: AppResponsive.w(40),
                      height: AppResponsive.w(40),
                      decoration: const BoxDecoration(
                        color: Color(0xFF8B5CF6),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.white,
                        size: AppResponsive.sp(22),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CreateAutomationCardContent extends StatelessWidget {
  const _CreateAutomationCardContent();

  @override
  Widget build(BuildContext context) {
    final radius = AppResponsive.r(25).clamp(20.0, 28.0);
    final cardHeight = AppResponsive.h(135).clamp(125.0, 155.0);
    final padding = AppResponsive.w(18).clamp(14.0, 22.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: double.infinity,
        height: cardHeight,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: const Color(0xFFA774FF).withOpacity(0.41),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create a New Automation',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.cardTitle.copyWith(
                      fontSize: AppResponsive.sp(16),
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: AppResponsive.h(10).clamp(8.0, 12.0)),
                  Text(
                    'Create a new Automation:\n'
                        'Launch a powerful, context\n'
                        'aware workflow for Instagram DM',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.cardSubtitle.copyWith(
                      fontSize: AppResponsive.sp(12),
                      height: 1.2,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppResponsive.w(10).clamp(8.0, 14.0)),
            Image.asset(
              'assets/images/robot.png',
              width: AppResponsive.w(95).clamp(82.0, 110.0),
              height: AppResponsive.h(90).clamp(78.0, 105.0),
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}