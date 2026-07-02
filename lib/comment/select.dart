import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../automation/controller/autodm_con.dart';
import '../core/constant/app_colors.dart';
import '../core/constant/app_responsive.dart';
import '../core/constant/app_text.dart';
import '../core/constant/routes/app_routes.dart';
import '../core/widget/gradient_button.dart';
import '../core/widget/step_progress_indicator.dart';

class SelectPostScreen extends StatelessWidget {
  const SelectPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    final AutoDmController c = Get.find<AutoDmController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppResponsive.h(18)),

              Text(
                'Select a Post or Reel',
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppResponsive.sp(16),
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),

              SizedBox(height: AppResponsive.h(14)),

              const StepProgressBar(currentStep: 1),

              SizedBox(height: AppResponsive.h(34)),

              _AllPostsToggle(controller: c),

              SizedBox(height: AppResponsive.h(12)),

              SizedBox(
                height: AppResponsive.h(151),
                child: Obx(() {
                  final selectedIndex = c.selectedPostIndex.value;

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder: (_, __) =>
                        SizedBox(width: AppResponsive.w(12)),
                    itemBuilder: (context, index) {
                      final selected = selectedIndex == index;

                      return GestureDetector(
                        onTap: () => c.selectPost(index),
                        child: _PostItem(index: index, selected: selected),
                      );
                    },
                  );
                }),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: AppResponsive.h(8)),
                  child: Text(
                    'View More ⌄',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppResponsive.sp(11),
                      color: const Color(0xFFA6A6A6),
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppResponsive.h(8)),

              Text(
                'Name your Automation',
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppResponsive.sp(16),
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),

              SizedBox(height: AppResponsive.h(10)),

              SizedBox(
                height: AppResponsive.h(43),
                child: TextField(
                  onChanged: c.setAutomationName,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.inputText.copyWith(
                    fontSize: AppResponsive.sp(12),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Eg. Shoe Collection Automation',
                    hintStyle: AppTextStyles.inputHint.copyWith(
                      fontSize: AppResponsive.sp(12),
                      color: const Color(0xFFB9B9B9),
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppResponsive.w(14),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppResponsive.r(20)),
                      borderSide: const BorderSide(
                        color: Color(0xFFD6B8FF),
                        width: 1,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppResponsive.r(20)),
                      borderSide: const BorderSide(
                        color: Color(0xFFA774FF),
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              Padding(
                padding: EdgeInsets.only(bottom: AppResponsive.h(65)),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: AppResponsive.h(46),
                        child: GradientButton(
                          label: 'Back',
                          isOutlined: true,
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
                          onTap: () => Get.toNamed(AppRoutes.replyTo),
                        ),
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

class _PostItem extends StatelessWidget {
  final int index;
  final bool selected;

  const _PostItem({required this.index, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppResponsive.w(112),
      height: AppResponsive.h(151),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppResponsive.r(4)),
        color: index == 0 ? Colors.black : const Color(0xFFEFEFEF),
      ),
      child: Stack(
        children: [
          if (index == 0)
            Center(
              child: Text(
                'Next Post\nor Reel',
                textAlign: TextAlign.center,
                style: AppTextStyles.cardTitle.copyWith(
                  color: AppColors.white,
                  fontSize: AppResponsive.sp(13),
                  height: 1.1,
                ),
              ),
            )
          else
            ClipRRect(
              borderRadius: BorderRadius.circular(AppResponsive.r(4)),
              child: Image.asset(
                index == 1
                    ? 'assets/images/post_1.png'
                    : 'assets/images/post_2.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

          Positioned(
            top: AppResponsive.h(7),
            right: AppResponsive.w(7),
            child: Container(
              width: AppResponsive.w(17),
              height: AppResponsive.w(17),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? const Color(0xFFA774FF) : Colors.white70,
                border: Border.all(
                  color: selected ? AppColors.white : const Color(0xFF7A7A7A),
                  width: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AllPostsToggle extends StatelessWidget {
  final AutoDmController controller;

  const _AllPostsToggle({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.h(43),
      padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(16)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppResponsive.r(13)),
        border: Border.all(color: const Color(0xFFD6B8FF), width: 1),
      ),
      child: Row(
        children: [
          Text(
            'All Post/ Reel',
            style: AppTextStyles.fieldLabel.copyWith(
              fontSize: AppResponsive.sp(13),
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const Spacer(),
          Obx(() {
            final value = controller.showAllPosts.value;

            return Transform.scale(
              scale: 0.75,
              child: Switch(
                value: value,
                activeColor: AppColors.white,
                activeTrackColor: const Color(0xFFA774FF),
                inactiveThumbColor: const Color(0xFFA6A6A6),
                inactiveTrackColor: const Color(0xFFE8E8E8),
                onChanged: controller.toggleShowAllPosts,
              ),
            );
          }),
        ],
      ),
    );
  }
}
