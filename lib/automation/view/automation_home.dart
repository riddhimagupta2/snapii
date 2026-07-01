import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/app_responsive.dart';
import '../../core/constant/app_text.dart';
import '../../core/constant/routes/app_routes.dart';
import '../../core/widget/app_bar.dart';
import '../../core/widget/gradient_button.dart';

class LiveAutomationPreviewScreen extends StatelessWidget {
  const LiveAutomationPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      appBar: const AppBarWidget(title: 'Smart Auto DM'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Live Automations Preview',
                style: AppTextStyles.fieldLabel.copyWith(
                  fontSize: AppResponsive.sp(14),
                  color: AppColors.greyText,
                ),
              ),
              SizedBox(height: AppResponsive.h(12)),
              _ChatPreviewCard(),
              SizedBox(height: AppResponsive.h(18)),
              Center(
                child: Text(
                  'Automate conversations. Grow effortlessly.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: AppResponsive.sp(13),
                  ),
                ),
              ),
              SizedBox(height: AppResponsive.h(15)),
              _CreateAutomationCard(
                onCreate: () => Get.toNamed(AppRoutes.triggerType),
              ),
              SizedBox(height: AppResponsive.h(20)),
            ],
          ),
        ),
      ),
    );
  }
}

/// The dark chat-bubble mock shown at the top of the screen.
class _ChatPreviewCard extends StatelessWidget {
  const _ChatPreviewCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppResponsive.w(358),
      padding: EdgeInsets.all(AppResponsive.w(18)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppResponsive.r(30)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withValues(alpha: .55),
            const Color(0xFFF7F2FF).withValues(alpha: .55),
          ],
        ),
        border: Border.all(
          color: const Color(0xFFA774FF).withValues(alpha: .44),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA774FF).withValues(alpha: .15),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          /// Incoming Message
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: AppResponsive.w(240),
              padding: EdgeInsets.all(AppResponsive.w(16)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppResponsive.r(12)),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hey there! I'm so happy you're\nhere, thanks so much for your\ninterest 😊\n\nClick below and I'll send you the\nlink in just a sec",
                    style: AppTextStyles.chatBubble.copyWith(
                      fontSize: AppResponsive.sp(12),
                      color: AppColors.black,
                      height: 1.4,
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
                      borderRadius: BorderRadius.circular(AppResponsive.r(8)),
                    ),
                    child: Text(
                      "Send me the link",
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

          SizedBox(height: AppResponsive.h(10)),

          /// Purple bubble
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
                "Send me the link",
                style: AppTextStyles.chatBubble.copyWith(
                  fontSize: AppResponsive.sp(12),
                  color: AppColors.white,
                ),
              ),
            ),
          ),

          SizedBox(height: AppResponsive.h(5)),

          /// Username
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppResponsive.w(22),
                vertical: AppResponsive.h(12),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppResponsive.r(12)),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                "@label_wildchild",
                style: AppTextStyles.chatBubble.copyWith(
                  fontSize: AppResponsive.sp(12),
                  color: AppColors.black,
                ),
              ),
            ),
          ),

          SizedBox(height: AppResponsive.h(10)),

          /// Input
          Container(
            height: AppResponsive.h(52),
            padding: EdgeInsets.only(
              left: AppResponsive.w(18),
              right: AppResponsive.w(6),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppResponsive.r(28)),
              border: Border.all(
                color: const Color(0xFFA774FF).withValues(alpha: .44),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Message...",
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
                    color: Colors.white,
                    size: AppResponsive.sp(22),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CreateAutomationCard extends StatelessWidget {
  final VoidCallback onCreate;

  const _CreateAutomationCard({required this.onCreate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppResponsive.h(197),
      padding: EdgeInsets.fromLTRB(
        AppResponsive.w(20),
        AppResponsive.h(20),
        AppResponsive.w(20),
        AppResponsive.h(16),
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.59),
        borderRadius: BorderRadius.circular(AppResponsive.r(25)),
        border: Border.all(
          color: const Color(0xFFA774FF).withValues(alpha: 0.41),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          /// Title full width
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Text(
              'Create a New Automation',
              maxLines: 1,
              style: AppTextStyles.cardTitle.copyWith(
                fontSize: AppResponsive.sp(16),
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
          ),

          /// Description only left side
          Positioned(
            left: 0,
            top: AppResponsive.h(34),
            child: SizedBox(
              width: AppResponsive.w(195),
              child: Text(
                'Create  a new Automation:\n'
                'Launch a powerful,context\n'
                'aware workflow for your Instagram DM',
                maxLines: 4,
                overflow: TextOverflow.visible,
                style: AppTextStyles.cardSubtitle.copyWith(
                  fontSize: AppResponsive.sp(12),
                  height: 1.12,
                  color: AppColors.greyText,
                ),
              ),
            ),
          ),

          /// Robot
          Positioned(
            right: AppResponsive.w(-3),
            top: AppResponsive.h(20),
            child: Image.asset(
              'assets/images/robot.png',
              width: AppResponsive.w(106),
              height: AppResponsive.h(90),
              fit: BoxFit.contain,
            ),
          ),

          /// Button
          Positioned(
            left: AppResponsive.w(10),
            right: AppResponsive.w(10),
            bottom: 0,
            child: SizedBox(
              height: AppResponsive.h(49),
              child: GradientButton(
                label: 'Create Automation',
                onTap: onCreate,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
