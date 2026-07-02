import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../automation/controller/autodm_con.dart';
import '../core/constant/app_colors.dart';
import '../core/constant/app_responsive.dart';
import '../core/constant/app_text.dart';
import '../core/constant/routes/app_routes.dart';
import '../core/widget/gradient_button.dart';
import '../core/widget/step_progress_indicator.dart';

class SendDmScreen extends StatelessWidget {
  const SendDmScreen({super.key});

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
              Text(
                'Send a DM',
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppResponsive.sp(16),
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),

              SizedBox(height: AppResponsive.h(5)),

              const StepProgressBar(currentStep: 3),

              SizedBox(height: AppResponsive.h(34)),

              const _DmPreview(),

              SizedBox(height: AppResponsive.h(16)),

              _MessageImageBox(controller: c),

              SizedBox(height: AppResponsive.h(8)),

              Obx(
                () => _SwitchTile(
                  title: 'Opening Message',
                  value: c.openingMessageEnabled.value,
                  onChanged: (val) {
                    c.openingMessageEnabled.value = val;

                    if (val) {
                      _showOpeningMessageSheet(context);
                    }
                  },
                ),
              ),

              SizedBox(height: AppResponsive.h(8)),

              Obx(
                () => _SwitchTile(
                  title: 'Ask to follow before DM',
                  value: c.followBeforeDmEnabled.value,
                  onChanged: (val) {
                    c.followBeforeDmEnabled.value = val;
                  },
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
                          onTap: () => Get.toNamed(AppRoutes.sendmPreview),
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

class _DmPreview extends StatelessWidget {
  const _DmPreview();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppResponsive.w(289),
        height: AppResponsive.h(190),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppResponsive.r(20)),
          border: Border.all(color: const Color(0xFFEDEDED)),
        ),
        child: Stack(
          children: [
            Positioned(
              left: AppResponsive.w(18),
              bottom: AppResponsive.h(78),
              child: Container(
                width: AppResponsive.w(18),
                height: AppResponsive.w(18),
                decoration: const BoxDecoration(
                  color: Color(0xFFA774FF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: AppResponsive.w(52),
              bottom: AppResponsive.h(73),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppResponsive.w(15),
                  vertical: AppResponsive.h(7),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Setup a message',
                  style: AppTextStyles.caption.copyWith(
                    fontSize: AppResponsive.sp(10),
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              left: AppResponsive.w(14),
              right: AppResponsive.w(14),
              bottom: AppResponsive.h(16),
              child: Container(
                height: AppResponsive.h(32),
                padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(7)),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFDCDCDC)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: AppResponsive.w(24),
                      height: AppResponsive.w(24),
                      decoration: const BoxDecoration(
                        color: Color(0xFF888888),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: AppResponsive.sp(12),
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(width: AppResponsive.w(6)),
                    Text(
                      'Message...',
                      style: AppTextStyles.caption.copyWith(
                        fontSize: AppResponsive.sp(10),
                        color: const Color(0xFF9E9E9E),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.image_outlined,
                      size: AppResponsive.sp(12),
                      color: Colors.grey,
                    ),
                    SizedBox(width: AppResponsive.w(6)),
                    Icon(
                      Icons.chat_bubble_outline,
                      size: AppResponsive.sp(12),
                      color: Colors.grey,
                    ),
                    SizedBox(width: AppResponsive.w(6)),
                    Icon(
                      Icons.add_circle_outline,
                      size: AppResponsive.sp(13),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageImageBox extends StatelessWidget {
  final AutoDmController controller;

  const _MessageImageBox({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.h(152),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppResponsive.r(14)),
        border: Border.all(color: const Color(0xFFD6B8FF), width: 1),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppResponsive.w(22),
              AppResponsive.h(8),
              AppResponsive.w(22),
              0,
            ),
            child: InkWell(
              onTap: () {
                // Pick image
              },
              borderRadius: BorderRadius.circular(AppResponsive.r(22)),
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(AppResponsive.r(22)),
                  color: const Color(0xFFD8D8D8),
                  strokeWidth: 1,
                  dashPattern: const [5, 4],
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: AppResponsive.h(38),
                  child: Center(
                    child: Text(
                      'Select / Drop an Image',
                      style: AppTextStyles.caption.copyWith(
                        fontSize: AppResponsive.sp(13),
                        color: const Color(0xFF9E9E9E),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
              AppResponsive.w(22),
              AppResponsive.h(14),
              AppResponsive.w(22),
              0,
            ),
            child: GestureDetector(
              onTap: () {
                // Open bottom sheet or navigate to message editor
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Obx(() {
                  return Text(
                    controller.message.value.isEmpty
                        ? 'Enter your message here...'
                        : controller.message.value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: controller.message.value.isEmpty
                        ? AppTextStyles.caption.copyWith(
                            fontSize: AppResponsive.sp(12),
                            color: const Color(0xFFB3B3B3),
                          )
                        : AppTextStyles.inputText.copyWith(
                            fontSize: AppResponsive.sp(12),
                            color: AppColors.black,
                          ),
                  );
                }),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: AppResponsive.w(22),
              top: AppResponsive.h(6),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Obx(
                () => Text(
                  '${controller.message.value.length}/1000',
                  style: AppTextStyles.caption.copyWith(
                    fontSize: AppResponsive.sp(8),
                    color: const Color(0xFFB5B5B5),
                  ),
                ),
              ),
            ),
          ),

          const Spacer(),

          Container(height: AppResponsive.h(1), color: const Color(0xFFEFEFEF)),

          InkWell(
            onTap: () => _showAddLinkSheet(context),
            child: SizedBox(
              height: AppResponsive.h(36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    size: AppResponsive.sp(15),
                    color: const Color(0xFFA774FF),
                  ),
                  SizedBox(width: AppResponsive.w(8)),
                  Text(
                    'Add Link',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppResponsive.sp(13),
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
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

class _SwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: AppResponsive.h(34),
        padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(12)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFD9D9D9)),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyles.caption.copyWith(
                fontSize: AppResponsive.sp(12),
                color: const Color(0xFF777777),
              ),
            ),
            const Spacer(),

            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: AppResponsive.w(37),
              height: AppResponsive.h(20),
              padding: EdgeInsets.all(AppResponsive.w(2)),
              decoration: BoxDecoration(
                color: value
                    ? const Color(0xFFA774FF)
                    : const Color(0xFFEDEDED),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Align(
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: AppResponsive.w(16),
                  height: AppResponsive.w(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    value ? Icons.check : Icons.close,
                    size: AppResponsive.sp(9),
                    color: value ? const Color(0xFFA774FF) : Colors.grey,
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


class _TitleLinkField extends StatelessWidget {
  const _TitleLinkField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive.h(34),
      child: TextField(

        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppResponsive.w(14),
          ),
          hintText: "Enter Title        Open Link",
          hintStyle: TextStyle(
            color: Color(0xFFB8B8B8),
            fontSize: AppResponsive.sp(11),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFFD9D9D9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFFD9D9D9)),
          ),
        ),
      ),
    );
  }
}

class _LinkField extends StatelessWidget {
  const _LinkField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive.h(34),
      child: TextField(

        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppResponsive.w(14),
          ),
          hintText: "Enter Link        https://www.gucci.comGucci",
          hintStyle: TextStyle(
            color: Color(0xFFB8B8B8),
            fontSize: AppResponsive.sp(11),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFFD9D9D9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFFD9D9D9)),
          ),
        ),
      ),
    );
  }
}

void _showAddLinkSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppResponsive.r(18)),
      ),
    ),
    builder: (_) => Padding(
      padding: EdgeInsets.fromLTRB(
        AppResponsive.w(20),
        AppResponsive.h(18),
        AppResponsive.w(20),
        AppResponsive.h(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "Add Link",
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppResponsive.sp(14),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: Get.back,
                child: const Icon(Icons.close),
              ),
            ],
          ),

          SizedBox(height: AppResponsive.h(22)),

          const _TitleLinkField(),

          SizedBox(height: AppResponsive.h(10)),

          const _LinkField(),

          SizedBox(height: AppResponsive.h(20)),

          GradientButton(
            label: "Save",
            height: AppResponsive.h(45),
            onTap: Get.back,
          ),
        ],
      ),
    ),
  );
}

void _showOpeningMessageSheet(BuildContext context) {
  const msg =
      'Hey there 👋✨\n'
      'Thanks a lot for reaching out — really excited to\n'
      'see your interest 😊\n'
      'You’re just one step away from getting\n'
      'everything you need. Tap below and I’ll send the\n'
      'details right over 🚀';

  showModalBottomSheet(
    context: context,
    backgroundColor: Color(0xFFF3F3F3),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppResponsive.r(18)),
      ),
    ),
    builder: (_) => Padding(
      padding: EdgeInsets.fromLTRB(
        AppResponsive.w(22),
        AppResponsive.h(18),
        AppResponsive.w(22),
        AppResponsive.h(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Openning Message',
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppResponsive.sp(15),
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.close_outlined,
                  size: AppResponsive.sp(20),
                  color: AppColors.black,
                ),
              ),
            ],
          ),

          SizedBox(height: AppResponsive.h(16)),

          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              AppResponsive.w(22),
              AppResponsive.h(22),
              AppResponsive.w(22),
              AppResponsive.h(16),
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppResponsive.r(16)),
              border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  msg,
                  style: AppTextStyles.caption.copyWith(
                    fontSize: AppResponsive.sp(11),
                    color: const Color(0xFF777777),
                    height: 1.15,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: AppResponsive.h(14)),

                Text(
                  '${msg.length}/1000',
                  style: AppTextStyles.caption.copyWith(
                    fontSize: AppResponsive.sp(9),
                    color: const Color(0xFFB0B0B0),
                  ),
                ),

                SizedBox(height: AppResponsive.h(14)),

                Container(
                  height: AppResponsive.h(44),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppResponsive.w(14),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppResponsive.r(12)),
                    border: Border.all(
                      color: const Color(0xFFD0D0D0),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.radio_button_checked,
                        size: AppResponsive.sp(18),
                        color: const Color(0xFFA774FF),
                      ),

                      Expanded(
                        child: Center(
                          child: Text(
                            'Sent me the link',
                            style: AppTextStyles.caption.copyWith(
                              fontSize: AppResponsive.sp(13),
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Get.back();
                          _showEditMessageSheet(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(AppResponsive.w(2)),
                          child: Image.asset(
                            'assets/icons/edit.png',
                            width: AppResponsive.w(16),
                            height: AppResponsive.w(16),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

void _showEditMessageSheet(BuildContext context) {
  final controller = TextEditingController(text: 'Sent me the link');

  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppResponsive.r(18)),
      ),
    ),
    builder: (_) => Padding(
      padding: EdgeInsets.fromLTRB(
        AppResponsive.w(22),
        AppResponsive.h(18),
        AppResponsive.w(22),
        AppResponsive.h(28),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Edit Message',
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppResponsive.sp(16),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.close,
                  size: AppResponsive.sp(22),
                  color: AppColors.black,
                ),
              ),
            ],
          ),

          SizedBox(height: AppResponsive.h(22)),

          SizedBox(
            height: AppResponsive.h(40),
            child: TextField(
              controller: controller,
              cursorColor: const Color(0xFFA774FF),
              style: AppTextStyles.inputText.copyWith(
                fontSize: AppResponsive.sp(13),
                fontWeight: FontWeight.w500,
                color: const Color(0xFF3A3A3A),
              ),
              decoration: InputDecoration(
                hintText: 'Sent me the link',
                hintStyle: AppTextStyles.inputText.copyWith(
                  fontSize: AppResponsive.sp(13),
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF7A7A7A),
                ),
                filled: true,

                fillColor: Colors.white,

                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppResponsive.w(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppResponsive.r(12)),
                  borderSide: const BorderSide(color: Color(0xFFD7D7D7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppResponsive.r(12)),
                  borderSide: const BorderSide(
                    color: Color(0xFFA774FF),
                    width: 1.2,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: AppResponsive.h(12)),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: AppResponsive.h(2)),
                child: Icon(
                  Icons.info,
                  size: AppResponsive.sp(14),
                  color: const Color(0xFFA774FF),
                ),
              ),
              SizedBox(width: AppResponsive.w(8)),
              Expanded(
                child: Text(
                  'This is a postback button that lets users tap to send a quick reply without typing',
                  style: AppTextStyles.caption.copyWith(
                    fontSize: AppResponsive.sp(10),
                    color: const Color(0xFF777777),
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppResponsive.h(30)),

          SizedBox(
            width: double.infinity,
            height: AppResponsive.h(42),
            child: GradientButton(
              label: 'Save Message',
              onTap: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    ),
  );
}
