import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widget/step_progress_indicator.dart';
import '../automation/controller/autodm_con.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_responsive.dart';
import '../../../../core/constant/app_text.dart';
import '../../../../core/constant/routes/app_routes.dart';
import '../../../../core/widget/gradient_button.dart';


class OptionalActionScreen extends StatelessWidget {
  const OptionalActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    final AutoDmController controller = Get.find<AutoDmController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppResponsive.h(35)),

                    const StepProgressBar(currentStep: 4),

                    SizedBox(height: AppResponsive.h(28)),

                    const _DmPreviewCard(),

                    SizedBox(height: AppResponsive.h(14)),

                    Text(
                      'Optional actions to increase engagement and visibility.',
                      style: AppTextStyles.caption.copyWith(
                        fontSize: AppResponsive.sp(10),
                        color: const Color(0xFFB0B0B0),
                      ),
                    ),

                    SizedBox(height: AppResponsive.h(10)),

                    Obx(
                      () => _ReplyPublicToggle(
                        value: controller.replyPubliclyEnabled.value,
                        onChanged: (bool value) {
                          controller.toggleReplyPublicly(value);

                          if (value) {
                            FocusManager.instance.primaryFocus?.unfocus();

                            Future<void>.delayed(
                              const Duration(milliseconds: 100),
                              () {
                                if (!context.mounted) {
                                  return;
                                }

                                _showAutoPublicRepliesSheet(
                                  context,
                                  controller,
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),

                    SizedBox(height: AppResponsive.h(60)),

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
                                onTap: () => Get.toNamed(AppRoutes.previewAuto),
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
          ],
        ),
      ),
    );
  }
}
class _DmPreviewCard extends StatelessWidget {
  const _DmPreviewCard();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppResponsive.w(265),
        height: AppResponsive.h(205),
        padding: EdgeInsets.all(AppResponsive.w(10)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppResponsive.r(18)),
          border: Border.all(color: const Color(0xFFE8E8E8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: AppResponsive.w(155),
              padding: EdgeInsets.all(AppResponsive.w(12)),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppResponsive.r(8)),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: Column(
                children: [
                  Text(
                    'Hey there! I’m so happy you’re\n'
                    'here, thanks so much for your\n'
                    'interest 👋\n\n'
                    'Click below and I’ll send you the\n'
                    'link in just a sec',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppResponsive.sp(8),
                      color: AppColors.black,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: AppResponsive.h(10)),
                  Container(
                    height: AppResponsive.h(26),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6E6E6),
                      borderRadius: BorderRadius.circular(AppResponsive.r(6)),
                    ),
                    child: Text(
                      'Send me the link',
                      style: AppTextStyles.caption.copyWith(
                        fontSize: AppResponsive.sp(8),
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: AppResponsive.h(34),
              padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(7)),
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
                      fontSize: AppResponsive.sp(10),
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.image_outlined,
                    size: AppResponsive.sp(12),
                    color: Colors.grey,
                  ),
                  SizedBox(width: AppResponsive.w(8)),
                  Icon(
                    Icons.chat_bubble_outline,
                    size: AppResponsive.sp(12),
                    color: Colors.grey,
                  ),
                  SizedBox(width: AppResponsive.w(8)),
                  Icon(
                    Icons.add_circle_outline,
                    size: AppResponsive.sp(13),
                    color: Colors.grey,
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

class _ReplyPublicToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ReplyPublicToggle({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(AppResponsive.r(12)),
      child: Container(
        height: AppResponsive.h(43),
        padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(14)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppResponsive.r(12)),
          border: Border.all(
            color: value ? const Color(0xFFA774FF) : const Color(0xFFD9D9D9),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Reply publicly to comments',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.inputText.copyWith(
                  fontSize: AppResponsive.sp(13),
                  color: const Color(0xFF777777),
                ),
              ),
            ),
            SizedBox(width: AppResponsive.w(10)),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: AppResponsive.w(48),
              height: AppResponsive.h(24),
              padding: EdgeInsets.all(AppResponsive.w(3)),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppResponsive.r(30)),
                border: Border.all(
                  color: value
                      ? const Color(0xFFA774FF)
                      : const Color(0xFFBDBDBD),
                ),
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: AppResponsive.w(18),
                  height: AppResponsive.w(18),
                  decoration: BoxDecoration(
                    color: value
                        ? const Color(0xFFA774FF)
                        : const Color(0xFFBDBDBD),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    value ? Icons.check : Icons.close,
                    size: AppResponsive.sp(12),
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

Future<void> _showAutoPublicRepliesSheet(
  BuildContext context,
  AutoDmController controller,
) async {
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.55),
    builder: (BuildContext sheetContext) {
      final double keyboardHeight = MediaQuery.viewInsetsOf(
        sheetContext,
      ).bottom;

      return AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(bottom: keyboardHeight),
        child: FractionallySizedBox(
          heightFactor: keyboardHeight > 0 ? 0.92 : 0.70,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppResponsive.r(18)),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  _PublicReplyHeader(
                    onClose: () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      Navigator.pop(sheetContext);
                    },
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppResponsive.w(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppResponsive.h(18)),

                          Obx(
                            () => Column(
                              children: List.generate(
                                controller.publicReplies.length,
                                (int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: AppResponsive.h(8),
                                    ),
                                    child: _PublicReplyTile(
                                      text: controller.publicReplies[index],
                                      onDelete: () {
                                        controller.removePublicReply(index);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          SizedBox(height: AppResponsive.h(2)),

                          Obx(() {
                            if (controller.showAddPublicReplyField.value) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Add Reply',
                                    style: AppTextStyles.caption.copyWith(
                                      fontSize: AppResponsive.sp(10),
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  SizedBox(height: AppResponsive.h(6)),
                                  _AddReplyTextField(controller: controller),
                                ],
                              );
                            }

                            return _AddReplyButton(
                              onTap: controller.openPublicReplyField,
                            );
                          }),
                          SizedBox(height: AppResponsive.h(18)),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppResponsive.w(22),
                      AppResponsive.h(8),
                      AppResponsive.w(22),
                      AppResponsive.h(22),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: AppResponsive.h(45),
                      child: GradientButton(
                        label: 'Save',
                        onTap: () {
                          controller.addPublicReplyFromInput();

                          FocusManager.instance.primaryFocus?.unfocus();

                          Navigator.pop(sheetContext);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );

  controller.publicReplyController.clear();
}

class _AddReplyButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddReplyButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppResponsive.r(6)),
      child: Container(
        width: double.infinity,
        height: AppResponsive.h(31),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppResponsive.r(6)),
          border: Border.all(color: const Color(0xFFD9D9D9)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline,
              size: AppResponsive.sp(12),
              color: const Color(0xFF777777),
            ),
            SizedBox(width: AppResponsive.w(6)),
            Text(
              'Add Reply',
              style: AppTextStyles.caption.copyWith(
                fontSize: AppResponsive.sp(10),
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PublicReplyHeader extends StatelessWidget {
  final VoidCallback onClose;

  const _PublicReplyHeader({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppResponsive.w(18),
        AppResponsive.h(18),
        AppResponsive.w(14),
        0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Auto Public Replies',
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: AppResponsive.sp(15),
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: onClose,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: EdgeInsets.all(AppResponsive.w(5)),
                  child: Icon(
                    Icons.close,
                    size: AppResponsive.sp(18),
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Use multiple reply styles to keep comment replies engaging and\n'
              'less repetitive',
              style: AppTextStyles.caption.copyWith(
                fontSize: AppResponsive.sp(9),
                color: const Color(0xFF888888),
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PublicReplyTile extends StatelessWidget {
  final String text;
  final VoidCallback onDelete;

  const _PublicReplyTile({required this.text, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppResponsive.h(31),
      padding: EdgeInsets.symmetric(
        horizontal: AppResponsive.w(10),
        vertical: AppResponsive.h(7),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppResponsive.r(6)),
        border: Border.all(color: const Color(0xFFD6B8FF)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.chat_bubble,
            size: AppResponsive.sp(11),
            color: const Color(0xFF666666),
          ),
          SizedBox(width: AppResponsive.w(12)),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.caption.copyWith(
                fontSize: AppResponsive.sp(9.5),
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(width: AppResponsive.w(8)),
          InkWell(
            onTap: onDelete,
            child: Padding(
              padding: EdgeInsets.all(AppResponsive.w(3)),
              child: Icon(
                Icons.delete,
                size: AppResponsive.sp(13),
                color: const Color(0xFF666666),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddReplyTextField extends StatelessWidget {
  final AutoDmController controller;

  const _AddReplyTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive.h(58),
      child: TextField(
        controller: controller.publicReplyController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.center,
        maxLines: 1,
        onSubmitted: (_) {
          controller.addPublicReplyFromInput();
        },
        style: AppTextStyles.inputText.copyWith(
          fontSize: AppResponsive.sp(11),
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          hintText: 'Enter here...',
          hintStyle: AppTextStyles.caption.copyWith(
            fontSize: AppResponsive.sp(9),
            color: const Color(0xFFB7B7B7),
          ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppResponsive.w(12),
            vertical: AppResponsive.h(18),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppResponsive.r(8)),
            borderSide: const BorderSide(color: Color(0xFFD6B8FF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppResponsive.r(8)),
            borderSide: const BorderSide(color: Color(0xFFA774FF), width: 1.2),
          ),
        ),
      ),
    );
  }
}
