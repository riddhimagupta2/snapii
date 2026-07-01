import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../automation/controller/autodm_con.dart';
import '../core/constant/app_colors.dart';
import '../core/constant/app_responsive.dart';
import '../core/constant/app_text.dart';
import '../core/widget/gradient_button.dart';
import '../core/widget/step_progress_indicator.dart';

class ReplyToScreen extends StatelessWidget {
  const ReplyToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    final AutoDmController c = Get.find<AutoDmController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(22)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppResponsive.h(42)),

              Text(
                'Reply to',
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppResponsive.sp(16),
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),

              SizedBox(height: AppResponsive.h(4)),

              Text(
                'choose which comments should get an automatic reply',
                style: AppTextStyles.subHeading.copyWith(
                  fontSize: AppResponsive.sp(11),
                  color: const Color(0xFF9A9A9A),
                ),
              ),

              SizedBox(height: AppResponsive.h(26)),

              const StepProgressBar(currentStep: 2),

              SizedBox(height: AppResponsive.h(30)),

              Obx(
                    () => _ReplyRadioBox(
                  label: 'Any Comment',
                  selected: c.selectedReplyTo.value == ReplyToType.anyComment,
                  onTap: () => c.selectReplyTo(ReplyToType.anyComment),
                ),
              ),

              SizedBox(height: AppResponsive.h(16)),

              Text(
                'Specific Keywords',
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppResponsive.sp(16),
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),

              SizedBox(height: AppResponsive.h(12)),

              Obx(
                    () => _KeywordField(
                  enabled: c.selectedReplyTo.value ==
                      ReplyToType.specificKeywords,
                  onChanged: c.setKeywords,
                  onAddTap: () =>
                      c.selectReplyTo(ReplyToType.specificKeywords),
                ),
              ),

              SizedBox(height: AppResponsive.h(16)),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: AppResponsive.h(46),
                      child: SecondaryButton(
                        label: 'Back',
                        onTap: () => Get.back(),
                      ),
                    ),
                  ),
                  SizedBox(width: AppResponsive.w(26)),
                  Expanded(
                    child: SizedBox(
                      height: AppResponsive.h(46),
                      child: GradientButton(
                        label: 'Next',
                        onTap: () {
                          Get.snackbar(
                            'Automation ready',
                            'Your Smart Auto DM has been configured.',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _ReplyRadioBox extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ReplyRadioBox({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppResponsive.r(14)),
      child: Container(
        height: AppResponsive.h(43),
        padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(14)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppResponsive.r(14)),
          border: Border.all(
            color: const Color(0xFFD6B8FF),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: AppTextStyles.inputHint.copyWith(
                fontSize: AppResponsive.sp(14),
                color: const Color(0xFFA9A9A9),
              ),
            ),
            const Spacer(),
            Container(
              width: AppResponsive.w(20),
              height: AppResponsive.w(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFA774FF),
                  width: 1.5,
                ),
              ),
              child: selected
                  ? Center(
                child: Container(
                  width: AppResponsive.w(10),
                  height: AppResponsive.w(10),
                  decoration: const BoxDecoration(
                    color: Color(0xFFA774FF),
                    shape: BoxShape.circle,
                  ),
                ),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _KeywordField extends StatelessWidget {
  final bool enabled;
  final ValueChanged<String> onChanged;
  final VoidCallback onAddTap;

  const _KeywordField({
    required this.enabled,
    required this.onChanged,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive.h(43),
      child: TextField(
        enabled: enabled,
        onChanged: onChanged,
        style: AppTextStyles.inputText.copyWith(
          fontSize: AppResponsive.sp(14),
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          hintText: 'Type Here',
          hintStyle: AppTextStyles.inputHint.copyWith(
            fontSize: AppResponsive.sp(14),
            color: const Color(0xFFB5B5B5),
          ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppResponsive.w(14),
            vertical: 0,
          ),
          suffixIcon: GestureDetector(
            onTap: onAddTap,
            child: Container(
              margin: EdgeInsets.all(AppResponsive.w(10)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFA774FF),
                  width: 1.2,
                ),
              ),
              child: Icon(
                Icons.add,
                size: AppResponsive.sp(16),
                color: const Color(0xFFA774FF),
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppResponsive.r(14)),
            borderSide: const BorderSide(
              color: Color(0xFFD6B8FF),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppResponsive.r(14)),
            borderSide: const BorderSide(
              color: Color(0xFFA774FF),
              width: 1.2,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppResponsive.r(14)),
            borderSide: const BorderSide(
              color: Color(0xFFD6B8FF),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}