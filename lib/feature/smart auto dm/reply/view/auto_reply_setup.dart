import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_responsive.dart';
import '../../../../core/constant/app_text.dart';
import '../../../../core/constant/routes/app_routes.dart';
import '../../../../core/widget/gradient_button.dart';
import '../controller/reply.cont.dart';

class AutoReplySetupScreen extends StatelessWidget {
  const AutoReplySetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    final AutoReplySetupController c =
    Get.isRegistered<AutoReplySetupController>()
        ? Get.find<AutoReplySetupController>()
        : Get.put(AutoReplySetupController());

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(22)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppResponsive.h(18)),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: Get.back,
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: AppResponsive.sp(13),
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(width: AppResponsive.w(8)),
                        Text(
                          'Auto reply',
                          style: AppTextStyles.heading.copyWith(
                            fontSize: AppResponsive.sp(16),
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppResponsive.h(24)),
                    _label('Select a Post or Reel'),
                    SizedBox(height: AppResponsive.h(8)),

                    Obx(
                          () => _ToggleTile(
                        title: 'All Post/ Reel',
                        value: c.allPosts.value,
                        onChanged: c.toggleAllPosts,
                      ),
                    ),

                    SizedBox(height: AppResponsive.h(12)),

                    Obx(() {
                      final selectedIndex = c.selectedPostIndex.value;

                      return SizedBox(
                        height: AppResponsive.h(112),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          separatorBuilder: (_, __) =>
                              SizedBox(width: AppResponsive.w(12)),
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () => c.selectPost(index),
                              child: _PostCard(
                                index: index,
                                selected: selectedIndex == index,
                              ),
                            );
                          },
                        ),
                      );
                    }),

                    SizedBox(height: AppResponsive.h(18)),
                    _label('Name of Automation'),
                    SizedBox(height: AppResponsive.h(8)),

                    _InputField(
                      controller: c.automationNameController,
                      hint: 'Enter automation name',
                    ),

                    SizedBox(height: AppResponsive.h(18)),
                    _label('Advanced Setting'),
                    SizedBox(height: AppResponsive.h(10)),

                    Obx(
                          () => _ExpandableToggle(
                        title: 'Replies Per Reel',
                        value: c.repliesPerReel.value,
                        sliderValue: c.repliesPerReelLimit.value,
                        onChanged: c.toggleRepliesPerReel,
                        onSliderChanged: c.setRepliesPerReelLimit,
                      ),
                    ),

                    SizedBox(height: AppResponsive.h(12)),

                    _ReplyDelayBox(controller: c),

                    SizedBox(height: AppResponsive.h(12)),

                    Obx(
                          () => _ExpandableToggle(
                        title: 'Auto Like Comments',
                        value: c.autoLikeComments.value,
                        sliderValue: c.autoLikeLimit.value,
                        onChanged: c.toggleAutoLikeComments,
                        onSliderChanged: c.setAutoLikeLimit,
                      ),
                    ),

                    SizedBox(height: AppResponsive.h(100)),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(
                AppResponsive.w(42),
                AppResponsive.h(8),
                AppResponsive.w(42),
                AppResponsive.h(24),
              ),
              child: SizedBox(
                height: AppResponsive.h(48),
                width: double.infinity,
                child: GradientButton(
                  label: 'Next & Preview',
                  onTap: () => Get.toNamed(AppRoutes.replyPreview),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: AppTextStyles.fieldLabel.copyWith(
        fontSize: AppResponsive.sp(13),
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(AppResponsive.r(12)),
      child: Container(
        height: AppResponsive.h(42),
        padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(14)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppResponsive.r(12)),
          border: Border.all(color: const Color(0xFFD6B8FF)),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyles.inputText.copyWith(
                fontSize: AppResponsive.sp(12),
                color: AppColors.black,
              ),
            ),
            const Spacer(),
            _MiniSwitch(value: value),
          ],
        ),
      ),
    );
  }
}

class _MiniSwitch extends StatelessWidget {
  final bool value;

  const _MiniSwitch({required this.value});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: AppResponsive.w(34),
      height: AppResponsive.h(18),
      padding: EdgeInsets.all(AppResponsive.w(2)),
      decoration: BoxDecoration(
        color: value ? AppColors.primary : const Color(0xFFE5E5E5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 200),
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: AppResponsive.w(14),
          height: AppResponsive.w(14),
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            value ? Icons.check : Icons.close,
            size: AppResponsive.sp(9),
            color: value ? AppColors.primary : Colors.grey,
          ),
        ),
      ),
    );
  }
}

class _ExpandableToggle extends StatelessWidget {
  final String title;
  final bool value;
  final double sliderValue;
  final ValueChanged<bool> onChanged;
  final ValueChanged<double> onSliderChanged;

  const _ExpandableToggle({
    required this.title,
    required this.value,
    required this.sliderValue,
    required this.onChanged,
    required this.onSliderChanged,
  });

  @override
  Widget build(BuildContext context) {
    final safeValue = sliderValue.clamp(1000.0, 5000.0);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppResponsive.r(12)),
        border: Border.all(color: const Color(0xFFD6B8FF)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => onChanged(!value),
            child: Container(
              height: AppResponsive.h(42),
              padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(14)),
              child: Row(
                children: [
                  Text(
                    title,
                    style: AppTextStyles.inputText.copyWith(
                      fontSize: AppResponsive.sp(12),
                      color: AppColors.black,
                    ),
                  ),
                  const Spacer(),
                  _MiniSwitch(value: value),
                ],
              ),
            ),
          ),
          if (value)
            _LimitSlider(
              value: safeValue,
              onChanged: onSliderChanged,
            ),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final int index;
  final bool selected;

  const _PostCard({
    required this.index,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath =
    index == 1 ? 'assets/images/post_1.png' : 'assets/images/post_2.png';

    return SizedBox(
      width: AppResponsive.w(86),
      height: AppResponsive.h(112),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppResponsive.r(4)),
            child: index == 0
                ? Container(
              color: Colors.black,
              alignment: Alignment.center,
              child: Text(
                'Next Post\nor Reel',
                textAlign: TextAlign.center,
                style: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(10),
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
                : Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: AppResponsive.h(5),
            right: AppResponsive.w(5),
            child: Container(
              width: AppResponsive.w(17),
              height: AppResponsive.w(17),
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : Colors.white70,
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? AppColors.white : Colors.grey,
                  width: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const _InputField({
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive.h(42),
      child: TextField(
        controller: controller,
        style: AppTextStyles.inputText.copyWith(
          fontSize: AppResponsive.sp(12),
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.caption.copyWith(
            fontSize: AppResponsive.sp(11),
            color: const Color(0xFFB8B8B8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: AppResponsive.w(14)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppResponsive.r(10)),
            borderSide: const BorderSide(color: Color(0xFFDADADA)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppResponsive.r(10)),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}

class _ReplyDelayBox extends StatelessWidget {
  final AutoReplySetupController controller;

  const _ReplyDelayBox({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selected = controller.selectedDelayOption.value;

      return Container(
        padding: EdgeInsets.all(AppResponsive.w(12)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppResponsive.r(12)),
          border: Border.all(color: const Color(0xFFDADADA)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Reply delay',
                  style: AppTextStyles.caption.copyWith(
                    fontSize: AppResponsive.sp(12),
                    color: AppColors.black,
                  ),
                ),
                SizedBox(width: AppResponsive.w(6)),
                Icon(
                  Icons.info,
                  size: AppResponsive.sp(11),
                  color: AppColors.primary,
                ),
              ],
            ),
            SizedBox(height: AppResponsive.h(8)),
            PopupMenuButton<int>(
              color: AppColors.white,
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppResponsive.r(8)),
              ),
              onSelected: controller.selectDelayOption,
              itemBuilder: (_) => [
                PopupMenuItem(
                  enabled: false,
                  child: Row(
                    children: [
                      Text(
                        'When to send the Reply?',
                        style: AppTextStyles.caption.copyWith(
                          fontSize: AppResponsive.sp(11),
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.close, size: AppResponsive.sp(14)),
                    ],
                  ),
                ),
                _delayItem(30, selected),
                _delayItem(60, selected),
              ],
              child: Container(
                height: AppResponsive.h(36),
                padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(12)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppResponsive.r(8)),
                  border: Border.all(color: const Color(0xFFDADADA)),
                ),
                child: Row(
                  children: [
                    Text(
                      '$selected Seconds...',
                      style: AppTextStyles.caption.copyWith(
                        fontSize: AppResponsive.sp(10),
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  PopupMenuItem<int> _delayItem(int value, int selected) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(
            selected == value
                ? Icons.radio_button_checked
                : Icons.radio_button_off,
            size: AppResponsive.sp(16),
            color: AppColors.primary,
          ),
          SizedBox(width: AppResponsive.w(8)),
          Text(
            'After $value Seconds',
            style: AppTextStyles.caption.copyWith(
              fontSize: AppResponsive.sp(10),
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _LimitSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _LimitSlider({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final safeValue = value.clamp(1000.0, 5000.0);

    return Column(
      children: [
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 4,
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: const Color(0xFFE3D4FF),
            thumbColor: AppColors.primary,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: AppResponsive.w(6),
            ),
          ),
          child: Slider(
            value: safeValue,
            min: 1000,
            max: 5000,
            divisions: 2,
            onChanged: onChanged,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['1000', '2000', '5000'].map((e) {
              return Text(
                e,
                style: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(8),
                  color: const Color(0xFF777777),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: AppResponsive.h(8)),
      ],
    );
  }
}