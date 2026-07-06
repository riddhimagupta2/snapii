import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widget/step_progress_indicator.dart';
import '../automation/controller/autodm_con.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_responsive.dart';
import '../../../../core/constant/app_text.dart';
import '../../../../core/constant/routes/app_routes.dart';
import '../../../../core/widget/gradient_button.dart';

class FollowBeforeDmController extends GetxController {
  final message1 = 'Before I send the details 🥰'.obs;
  final desc1 =
      'Please follow the profile first, then tap\n"I’m Following" below to continue ✨'
          .obs;

  final message2 = 'It looks like the profile hasn’t been followed yet 😊'.obs;
  final desc2 = 'Follow the account first to unlock your access 🚀'.obs;
}

class FollowBeforeDmScreen extends StatelessWidget {
  const FollowBeforeDmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    final c = Get.put(FollowBeforeDmController());

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(20)),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: AppResponsive.h(90)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: AppResponsive.sp(14),
                      ),
                    ),
                    SizedBox(width: AppResponsive.w(6)),
                    Text(
                      'Send a DM',
                      style: AppTextStyles.heading.copyWith(
                        fontSize: AppResponsive.sp(16),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: AppResponsive.h(12)),

                const _PreviewChat(),

                SizedBox(height: AppResponsive.h(5)),

                Text(
                  'Ask to follow before DM',
                  style: AppTextStyles.subHeading.copyWith(
                    fontSize: AppResponsive.sp(14),
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),

                SizedBox(height: AppResponsive.h(5)),

                Obx(
                      () => _MessageCard(
                    title: c.message1.value,
                    desc: c.desc1.value,
                  ),
                ),

                SizedBox(height: AppResponsive.h(10)),

                Obx(
                      () => _MessageCard(
                    title: c.message2.value,
                    desc: c.desc2.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppResponsive.w(20),
            AppResponsive.h(8),
            AppResponsive.w(20),
            AppResponsive.h(12),
          ),
          child:GradientButton(
            label: 'Save & Continue',
            height: AppResponsive.h(50),
            onTap: () => Get.toNamed(AppRoutes.optionalAction)
          ),
        ),
      ),
    );
  }
}

class _PreviewChat extends StatelessWidget {
  const _PreviewChat();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.h(385),
      padding: EdgeInsets.all(AppResponsive.w(10)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppResponsive.r(16)),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const _IncomingBubble(),
            const Align(
              alignment: Alignment.centerRight,
              child: _OutgoingBubble(),
            ),
            SizedBox(height: AppResponsive.h(8)),
            const _IncomingBubble(second: true),
            const Align(
              alignment: Alignment.centerRight,
              child: _OutgoingBubble(),
            ),
            SizedBox(height: AppResponsive.h(2)),
            const _MessageInput(),
          ],
        ),
      ),
    );
  }
}

class _IncomingBubble extends StatelessWidget {
  final bool second;

  const _IncomingBubble({this.second = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!second)
          Container(
            width: AppResponsive.w(20),
            height: AppResponsive.w(20),
            margin: EdgeInsets.only(
              top: AppResponsive.h(8),
              right: AppResponsive.w(6),
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFA774FF),
              shape: BoxShape.circle,
            ),
          )
        else
          SizedBox(width: AppResponsive.w(26)),
        Container(
          width: AppResponsive.w(190),
          padding: EdgeInsets.all(AppResponsive.w(10)),
          decoration: BoxDecoration(
            color: const Color(0xFFE6E6E6),
            borderRadius: BorderRadius.circular(AppResponsive.r(8)),
          ),
          child: Column(
            children: [
              Text(
                second
                    ? 'It looks like the profile hasn’t been followed yet 😊\nFollow the account first to unlock your access 🚀'
                    : 'Before I send the details 🥰\n\nPlease follow the profile first, then tap\n"I’m Following" below to continue ✨',
                style: AppTextStyles.chatBubble.copyWith(
                  fontSize: AppResponsive.sp(9),
                  color: Colors.black87,
                  height: 1.25,
                ),
              ),
              SizedBox(height: AppResponsive.h(7)),
              const _MiniButton(text: '[ Visit Profile ]'),
              SizedBox(height: AppResponsive.h(6)),
              const _MiniButton(text: '[ I’m Following ✅ ]'),
            ],
          ),
        ),
      ],
    );
  }
}

class _OutgoingBubble extends StatelessWidget {
  const _OutgoingBubble();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: AppResponsive.h(6),
        bottom: AppResponsive.h(4),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppResponsive.w(12),
        vertical: AppResponsive.h(6),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFA774FF),
        borderRadius: BorderRadius.circular(AppResponsive.r(20)),
      ),
      child: Text(
        'I’m Following ✅',
        style: AppTextStyles.caption.copyWith(
          fontSize: AppResponsive.sp(9),
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _MiniButton extends StatelessWidget {
  final String text;

  const _MiniButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.h(22),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppResponsive.r(18)),
        border: Border.all(color: const Color(0xFFCFCFCF)),
      ),
      child: Text(
        text,
        style: AppTextStyles.caption.copyWith(
          fontSize: AppResponsive.sp(8.5),
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
    );
  }
}

class _MessageInput extends StatelessWidget {
  const _MessageInput();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.h(34),
      padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(6)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppResponsive.r(20)),
        border: Border.all(color: const Color(0xFFDADADA)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppResponsive.w(12),
            backgroundColor: const Color(0xFF8A8A8A),
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
              fontSize: AppResponsive.sp(11),
              color: Colors.grey,
            ),
          ),
          const Spacer(),
          Icon(Icons.image_outlined,
              size: AppResponsive.sp(13), color: Colors.grey),
          SizedBox(width: AppResponsive.w(8)),
          Icon(Icons.chat_bubble_outline,
              size: AppResponsive.sp(13), color: Colors.grey),
          SizedBox(width: AppResponsive.w(8)),
          Icon(Icons.add_circle_outline,
              size: AppResponsive.sp(14), color: Colors.grey),
        ],
      ),
    );
  }
}

class _MessageCard extends StatelessWidget {
  final String title;
  final String desc;

  const _MessageCard({
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppResponsive.w(11)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppResponsive.r(10)),
        border: Border.all(color: const Color(0xFFD2D2D2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.caption.copyWith(
              fontSize: AppResponsive.sp(10),
              color: Colors.grey,
            ),
          ),
          SizedBox(height: AppResponsive.h(8)),
          Text(
            desc,
            style: AppTextStyles.caption.copyWith(
              fontSize: AppResponsive.sp(10),
              color: const Color(0xFF666666),
              height: 1.3,
            ),
          ),
          SizedBox(height: AppResponsive.h(8)),
          const _EditableButton(text: 'Visit Profile'),
          SizedBox(height: AppResponsive.h(6)),
          const _EditableButton(text: 'I’m Following ✅'),
        ],
      ),
    );
  }
}

class _EditableButton extends StatelessWidget {
  final String text;

  const _EditableButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.h(34),
      padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(12)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppResponsive.r(10)),
        border: Border.all(color: const Color(0xFFD0D0D0)),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: AppTextStyles.inputText.copyWith(
              fontSize: AppResponsive.sp(12),
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => showEditButtonSheet(text),
            child: Image.asset(
              'assets/icons/edit.png',
              width: AppResponsive.w(15),
              height: AppResponsive.w(15),
              errorBuilder: (_, __, ___) => Icon(
                Icons.edit_outlined,
                size: AppResponsive.sp(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showEditButtonSheet(String buttonText) {
  final controller = TextEditingController(text: buttonText);

  showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppResponsive.r(18)),
      ),
    ),
    builder: (_) => CustomEditBottomSheet(
      title: 'Edit button',
      description:
      'This is a postback button that lets users tap to send a quick reply without typing',
      controller: controller,
      hintText: 'Button Text',
      counterText: '${controller.text.length}/60',
      prefixIcon: Icon(
        Icons.text_fields,
        size: AppResponsive.sp(18),
      ),
      onSave: () {
        Get.back();
      },
    ),
  );
}

class CustomEditBottomSheet extends StatelessWidget {
  final String title;
  final String description;
  final TextEditingController controller;
  final String hintText;
  final String counterText;
  final Widget prefixIcon;
  final VoidCallback onSave;

  const CustomEditBottomSheet({
    super.key,
    required this.title,
    required this.description,
    required this.controller,
    required this.hintText,
    required this.counterText,
    required this.prefixIcon,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Padding(
      padding: EdgeInsets.only(
        left: AppResponsive.w(20),
        right: AppResponsive.w(20),
        top: AppResponsive.h(18),
        bottom: MediaQuery.of(context).viewInsets.bottom + AppResponsive.h(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: AppTextStyles.heading.copyWith(
                  fontSize: AppResponsive.sp(16),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(Icons.close, size: AppResponsive.sp(22)),
              ),
            ],
          ),

          SizedBox(height: AppResponsive.h(24)),

          SizedBox(
            height: AppResponsive.h(44),
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              maxLength: 60,
              style: AppTextStyles.inputText.copyWith(
                fontSize: AppResponsive.sp(13),
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              decoration: InputDecoration(
                counterText: '',
                hintText: hintText,
                prefixIcon: prefixIcon,
                filled: true,
                fillColor: AppColors.white,
                contentPadding: EdgeInsets.symmetric(
                  vertical: AppResponsive.h(12),
                  horizontal: AppResponsive.w(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppResponsive.r(12)),
                  borderSide: const BorderSide(color: Color(0xFFD7D7D7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppResponsive.r(12)),
                  borderSide: const BorderSide(color: Color(0xFFA774FF)),
                ),
              ),
            ),
          ),

          SizedBox(height: AppResponsive.h(10)),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info,
                size: AppResponsive.sp(13),
                color: const Color(0xFFA774FF),
              ),
              SizedBox(width: AppResponsive.w(8)),
              Expanded(
                child: Text(
                  description,
                  style: AppTextStyles.caption.copyWith(
                    fontSize: AppResponsive.sp(10),
                    color: const Color(0xFF777777),
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppResponsive.h(32)),

          GestureDetector(
            onTap: onSave,
            child: Container(
              width: double.infinity,
              height: AppResponsive.h(45),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppResponsive.r(25)),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFC084FC),
                    Color(0xFF5F6CFF),
                  ],
                ),
              ),
              child: Text(
                'Save Message',
                style: AppTextStyles.buttonPrimary.copyWith(
                  fontSize: AppResponsive.sp(13),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}