import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../automation/controller/autodm_con.dart';
import '../core/constant/app_colors.dart';
import '../core/constant/app_responsive.dart';
import '../core/constant/app_text.dart';
import '../core/constant/routes/app_routes.dart';
import '../core/widget/gradient_button.dart';
import '../core/widget/step_progress_indicator.dart';

class ReplyToScreen extends StatelessWidget {
  const ReplyToScreen({super.key});

  static const Color purple = Color(0xFFC78BFF);
  static const Color deepPurple = Color(0xFF9B6BFF);
  static const Color blue = Color(0xFF5F6CFF);

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    final AutoDmController c = Get.find<AutoDmController>();

    return Scaffold(
      backgroundColor:  Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppResponsive.w(22),
            AppResponsive.h(18),
            AppResponsive.w(22),
            AppResponsive.h(26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reply to',
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppResponsive.sp(16),
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),

              SizedBox(height: AppResponsive.h(2)),

              Text(
                'choose which comments should get an automatic reply',
                style: AppTextStyles.subHeading.copyWith(
                  fontSize: AppResponsive.sp(11),
                  color: const Color(0xFFA2A2A2),
                ),
              ),

              SizedBox(height: AppResponsive.h(2)),

              const StepProgressBar(currentStep: 2),

              SizedBox(height: AppResponsive.h(50)),

              Obx(
                () => _ReplyChoiceBox(
                  label: 'Any Comment',
                  selected: c.selectedReplyTo.value == ReplyToType.anyComment,
                  onTap: () => c.selectReplyTo(ReplyToType.anyComment),
                ),
              ),

              SizedBox(height: AppResponsive.h(8)),

              Text(
                'Specific Keywords',
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppResponsive.sp(14),
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),

              SizedBox(height: AppResponsive.h(18)),

              _KeywordInput(controller: c),

              SizedBox(height: AppResponsive.h(12)),

              Obx(
                () => Wrap(
                  spacing: AppResponsive.w(8),
                  runSpacing: AppResponsive.h(8),
                  children: c.keywords
                      .map(
                        (keyword) => _KeywordChip(
                          label: keyword,
                          onRemove: () => c.removeKeyword(keyword),
                        ),
                      )
                      .toList(),
                ),
              ),

              const Spacer(),

              Padding(
                padding: EdgeInsets.only(bottom: AppResponsive.h(65)),
                child: Row(
                  children: [
                    Expanded(
                      child: GradientButton(
                        label: "Back",
                        isOutlined: true,
                        height: AppResponsive.h(46),
                        onTap: () => Get.back(),
                      ),
                    ),
                    SizedBox(width: AppResponsive.w(22)),
                    Expanded(
                      child: GradientButton(
                        label: "Next",
                        height: AppResponsive.h(46),
                        onTap: () {
                          Get.toNamed(AppRoutes.sendAdm);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReplyChoiceBox extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ReplyChoiceBox({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  static const Color purple = Color(0xFFC78BFF);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppResponsive.r(30)),
      child: Container(
        height: AppResponsive.h(38),
        padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(14)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppResponsive.r(30)),
          border: Border.all(color: purple, width: 1),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: AppTextStyles.inputText.copyWith(
                fontSize: AppResponsive.sp(13),
                color: const Color(0xFF4B4B4B),
              ),
            ),
            const Spacer(),
            Container(
              width: AppResponsive.w(28),
              height: AppResponsive.h(14),
              decoration: BoxDecoration(
                color: const Color(0xFFE8E8E8),
                borderRadius: BorderRadius.circular(AppResponsive.r(30)),
              ),
              child: Align(
                alignment: selected
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: AppResponsive.w(14),
                  height: AppResponsive.w(14),
                  decoration: const BoxDecoration(
                    color: Color(0xFFB8B8B8),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: AppResponsive.sp(9),
                    color: AppColors.white,
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

class _KeywordInput extends StatelessWidget {
  final AutoDmController controller;

  const _KeywordInput({required this.controller});

  static const Color purple = Color(0xFFC78BFF);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive.h(40),
      child: TextField(
        controller: controller.keywordController,
        onTap: () {
          controller.selectReplyTo(ReplyToType.specificKeywords);
        },
        onSubmitted: (_) => controller.addKeyword(),
        style: AppTextStyles.inputText.copyWith(
          fontSize: AppResponsive.sp(13),
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          hintText: 'Type Here',
          hintStyle: AppTextStyles.inputHint.copyWith(
            fontSize: AppResponsive.sp(13),
            color: const Color(0xFFB8B8B8),
          ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: AppResponsive.w(14)),
          suffixIcon: GestureDetector(
            onTap: controller.addKeyword,
            child: Container(
              width: AppResponsive.w(20),
              height: AppResponsive.w(20),
              margin: EdgeInsets.all(AppResponsive.w(8)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: purple, width: 1.2),
              ),
              child: Icon(
                Icons.add,
                size: AppResponsive.sp(15),
                color: const Color(0xFFA66BFF),
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppResponsive.r(30)),
            borderSide: const BorderSide(color: purple, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppResponsive.r(30)),
            borderSide: const BorderSide(color: purple, width: 1.2),
          ),
        ),
      ),
    );
  }
}

class _KeywordChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _KeywordChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppResponsive.w(12),
        vertical: AppResponsive.h(7),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF4ECFF),
        borderRadius: BorderRadius.circular(AppResponsive.r(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTextStyles.inputText.copyWith(
              fontSize: AppResponsive.sp(12),
              color: const Color(0xFF8B5CF6),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: AppResponsive.w(6)),
          GestureDetector(
            onTap: onRemove,
            child: Icon(
              Icons.close,
              size: AppResponsive.sp(14),
              color: const Color(0xFF8B5CF6),
            ),
          ),
        ],
      ),
    );
  }
}