import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.symmetric(
                  horizontal: AppResponsive.w(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppResponsive.h(10)),

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
                        onChanged: (value) {
                          c.openingMessageEnabled.value = value;

                          if (value) {
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
                        onChanged: (value) {
                          c.followBeforeDmEnabled.value = value;

                          if (value) {
                            _showFollowBeforeDmSheet(
                              context,
                              c,
                            );
                          }
                        },
                      ),
                    ),

                    SizedBox(height: AppResponsive.h(25)),
                  ],
                ),
              ),
            ),

            Container(
              color: AppColors.white,
              padding: EdgeInsets.fromLTRB(
                AppResponsive.w(20),
                AppResponsive.h(10),
                AppResponsive.w(20),
                AppResponsive.h(14),
              ),
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
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.optionalAction,
                          );
                        },
                      ),
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
}

class _DmPreview extends StatelessWidget {
  const _DmPreview();

  @override
  Widget build(BuildContext context) {
    final AutoDmController c = Get.find<AutoDmController>();

    return Center(
      child: Container(
        width: AppResponsive.w(289),
        height: AppResponsive.h(190),
        padding: EdgeInsets.all(
          AppResponsive.w(14),
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            AppResponsive.r(20),
          ),
          border: Border.all(
            color: const Color(0xFFEDEDED),
          ),
        ),
        child: Column(
          children: [
            const Spacer(),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: AppResponsive.w(18),
                  height: AppResponsive.w(18),
                  decoration: const BoxDecoration(
                    color: Color(0xFFA774FF),
                    shape: BoxShape.circle,
                  ),
                ),

                SizedBox(width: AppResponsive.w(16)),

                Flexible(
                  child: Obx(
                        () => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppResponsive.w(15),
                        vertical: AppResponsive.h(7),
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5E5E5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        c.message.value.isEmpty
                            ? 'Setup a message'
                            : c.message.value,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.caption.copyWith(
                          fontSize: AppResponsive.sp(10),
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: AppResponsive.h(28)),

            const _MessageInputPreview(),
          ],
        ),
      ),
    );
  }
}

class _MessageInputPreview extends StatelessWidget {
  const _MessageInputPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.h(32),
      padding: EdgeInsets.symmetric(
        horizontal: AppResponsive.w(7),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFDCDCDC),
        ),
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
    );
  }
}

class _MessageImageBox extends StatelessWidget {
  final AutoDmController controller;

  const _MessageImageBox({
    required this.controller,
  });

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image == null) return;

    controller.setDmImage(
      File(image.path),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          AppResponsive.r(14),
        ),
        border: Border.all(
          color: const Color(0xFFD6B8FF),
        ),
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
            child: Obx(
                  () {
                final File? image =
                    controller.selectedDmImage.value;

                if (image != null) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppResponsive.r(12),
                        ),
                        child: Image.file(
                          image,
                          width: double.infinity,
                          height: AppResponsive.h(110),
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        top: AppResponsive.h(6),
                        right: AppResponsive.w(6),
                        child: GestureDetector(
                          onTap: controller.removeDmImage,
                          child: Container(
                            width: AppResponsive.w(26),
                            height: AppResponsive.w(26),
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              size: AppResponsive.sp(15),
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return InkWell(
                  onTap: _pickImage,
                  borderRadius: BorderRadius.circular(
                    AppResponsive.r(22),
                  ),
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      radius: Radius.circular(
                        AppResponsive.r(22),
                      ),
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
                          style:
                          AppTextStyles.caption.copyWith(
                            fontSize: AppResponsive.sp(13),
                            color: const Color(0xFF9E9E9E),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
              AppResponsive.w(22),
              AppResponsive.h(12),
              AppResponsive.w(22),
              0,
            ),
            child: TextField(
              controller: controller.messageController,
              maxLength: 1000,
              minLines: 2,
              maxLines: 5,
              cursorColor: AppColors.primary,
              onChanged: controller.setMessage,
              style: AppTextStyles.inputText.copyWith(
                fontSize: AppResponsive.sp(12),
                color: AppColors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Enter your message here...',
                hintStyle: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(12),
                  color: const Color(0xFFB3B3B3),
                ),

                // transparent
                filled: true,
                fillColor: Colors.transparent,

                counterText: '',
                isDense: true,

                // remove all borders
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,

                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: AppResponsive.w(22),
              right: AppResponsive.w(22),
              bottom: AppResponsive.h(8),
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

          Container(
            height: 1,
            color: const Color(0xFFEFEFEF),
          ),

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
                    color: AppColors.primary,
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
      borderRadius: BorderRadius.circular(
        AppResponsive.r(12),
      ),
      child: Container(
        height: AppResponsive.h(34),
        padding: EdgeInsets.symmetric(
          horizontal: AppResponsive.w(12),
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            AppResponsive.r(12),
          ),
          border: Border.all(
            color: const Color(0xFFD9D9D9),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(12),
                  color: const Color(0xFF777777),
                ),
              ),
            ),

            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: AppResponsive.w(37),
              height: AppResponsive.h(20),
              padding: EdgeInsets.all(
                AppResponsive.w(2),
              ),
              decoration: BoxDecoration(
                color: value
                    ? AppColors.primary
                    : const Color(0xFFEDEDED),
                borderRadius: BorderRadius.circular(30),
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment: value
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: AppResponsive.w(16),
                  height: AppResponsive.w(16),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    value ? Icons.check : Icons.close,
                    size: AppResponsive.sp(9),
                    color: value
                        ? AppColors.primary
                        : Colors.grey,
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

void _showFollowBeforeDmSheet(
    BuildContext context,
    AutoDmController controller,
    ) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(
          AppResponsive.r(18),
        ),
      ),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          left: AppResponsive.w(20),
          right: AppResponsive.w(20),
          top: AppResponsive.h(18),
          bottom:
          MediaQuery.of(context).viewInsets.bottom +
              AppResponsive.h(24),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Ask to follow before DM',
                    style:
                    AppTextStyles.heading.copyWith(
                      fontSize: AppResponsive.sp(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: Get.back,
                    child: Icon(
                      Icons.close,
                      size: AppResponsive.sp(21),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppResponsive.h(8)),

              Text(
                'Set up the messages shown before sending the DM.',
                style: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(10),
                  color: const Color(0xFF777777),
                ),
              ),

              SizedBox(height: AppResponsive.h(20)),

              _FollowEditableCard(
                title: 'First Message',
                value: controller.followMessage1,
                description:
                controller.followDescription1,
              ),

              SizedBox(height: AppResponsive.h(12)),

              _FollowEditableCard(
                title: 'Follow Reminder',
                value: controller.followMessage2,
                description:
                controller.followDescription2,
              ),

              SizedBox(height: AppResponsive.h(24)),

              GradientButton(
                label: 'Save & Continue',
                height: AppResponsive.h(46),
                onTap: Get.back,
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _FollowEditableCard extends StatelessWidget {
  final String title;
  final RxString value;
  final RxString description;

  const _FollowEditableCard({
    required this.title,
    required this.value,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        AppResponsive.w(12),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          AppResponsive.r(10),
        ),
        border: Border.all(
          color: const Color(0xFFD2D2D2),
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.fieldLabel.copyWith(
              fontSize: AppResponsive.sp(11),
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: AppResponsive.h(8)),

          Obx(
                () => TextFormField(
              initialValue: value.value,
              maxLines: null,
              onChanged: (text) {
                value.value = text;
              },
              style: AppTextStyles.inputText.copyWith(
                fontSize: AppResponsive.sp(11),
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(
                  AppResponsive.w(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    AppResponsive.r(8),
                  ),
                  borderSide: const BorderSide(
                    color: Color(0xFFE0E0E0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    AppResponsive.r(8),
                  ),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: AppResponsive.h(8)),

          Obx(
                () => TextFormField(
              initialValue: description.value,
              maxLines: 3,
              onChanged: (text) {
                description.value = text;
              },
              style: AppTextStyles.inputText.copyWith(
                fontSize: AppResponsive.sp(10),
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(
                  AppResponsive.w(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    AppResponsive.r(8),
                  ),
                  borderSide: const BorderSide(
                    color: Color(0xFFE0E0E0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    AppResponsive.r(8),
                  ),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: AppResponsive.h(8)),

          const _FollowButton(
            text: 'Visit Profile',
          ),

          SizedBox(height: AppResponsive.h(6)),

          const _FollowButton(
            text: 'I’m Following ✅',
          ),
        ],
      ),
    );
  }
}

class _FollowButton extends StatelessWidget {
  final String text;

  const _FollowButton({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppResponsive.h(34),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          AppResponsive.r(10),
        ),
        border: Border.all(
          color: const Color(0xFFD0D0D0),
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.inputText.copyWith(
          fontSize: AppResponsive.sp(11),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

void _showAddLinkSheet(BuildContext context) {
  final titleController =
  TextEditingController();

  final linkController =
  TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(
          AppResponsive.r(18),
        ),
      ),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          left: AppResponsive.w(20),
          right: AppResponsive.w(20),
          top: AppResponsive.h(18),
          bottom:
          MediaQuery.of(context).viewInsets.bottom +
              AppResponsive.h(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'Add Link',
                  style:
                  AppTextStyles.heading.copyWith(
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

            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Enter Title',
              ),
            ),

            SizedBox(height: AppResponsive.h(10)),

            TextField(
              controller: linkController,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                hintText: 'Enter Link',
              ),
            ),

            SizedBox(height: AppResponsive.h(20)),

            GradientButton(
              label: 'Save',
              height: AppResponsive.h(45),
              onTap: Get.back,
            ),
          ],
        ),
      );
    },
  );
}

void _showOpeningMessageSheet(
    BuildContext context,
    ) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(
          AppResponsive.r(18),
        ),
      ),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          AppResponsive.w(22),
          AppResponsive.h(18),
          AppResponsive.w(22),
          AppResponsive.h(28),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Opening Message',
                  style:
                  AppTextStyles.heading.copyWith(
                    fontSize: AppResponsive.sp(15),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Spacer(),

                GestureDetector(
                  onTap: Get.back,
                  child: const Icon(Icons.close),
                ),
              ],
            ),

            SizedBox(height: AppResponsive.h(20)),

            Text(
              'Hey there 👋✨\n'
                  'Thanks a lot for reaching out — really excited to see your interest 😊\n'
                  'You’re just one step away from getting everything you need.',
              style: AppTextStyles.caption.copyWith(
                fontSize: AppResponsive.sp(11),
                color: const Color(0xFF777777),
                height: 1.3,
              ),
            ),

            SizedBox(height: AppResponsive.h(20)),

            GradientButton(
              label: 'Save Message',
              onTap: Get.back,
            ),
          ],
        ),
      );
    },
  );
}