import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../automation/controller/autodm_con.dart';
import '../../../core/widget/step_progress_indicator.dart';
import '../automation/controller/autodm_con.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_responsive.dart';
import '../../../../core/constant/app_text.dart';
import '../../../../core/constant/routes/app_routes.dart';
import '../../../../core/widget/gradient_button.dart';

class SendDmScreen extends StatelessWidget {
  const SendDmScreen({super.key});

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
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(20)),
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

                    _MessageImageBox(controller: controller),

                    SizedBox(height: AppResponsive.h(8)),

                    Obx(
                      () => _SwitchTile(
                        title: 'Opening Message',
                        value: controller.openingMessageEnabled.value,
                        onChanged: (value) {
                          controller.toggleOpeningMessage(value);

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
                        value: controller.followBeforeDmEnabled.value,
                        onChanged: (value) {
                          controller.toggleFollowBeforeDm(value);

                          if (value) {
                            _showFollowBeforeDmSheet(context, controller);
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
                    child: GradientButton(
                      label: 'Back',
                      height: AppResponsive.h(46),
                      isOutlined: true,
                      onTap: Get.back,
                    ),
                  ),

                  SizedBox(width: AppResponsive.w(26)),

                  Expanded(
                    child: GradientButton(
                      label: 'Next',
                      height: AppResponsive.h(46),
                      onTap: () {
                        Get.toNamed(AppRoutes.optionalAction);
                      },
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

// ============================================================
// DM PREVIEW
// ============================================================

class _DmPreview extends StatelessWidget {
  const _DmPreview();

  @override
  Widget build(BuildContext context) {
    final AutoDmController controller = Get.find<AutoDmController>();

    return Center(
      child: Container(
        width: AppResponsive.w(289),
        height: AppResponsive.h(190),
        padding: EdgeInsets.all(AppResponsive.w(14)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppResponsive.r(20)),
          border: Border.all(color: const Color(0xFFEDEDED)),
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
                        controller.message.value.isEmpty
                            ? 'Setup a message'
                            : controller.message.value,
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
    );
  }
}

// ============================================================
// MESSAGE + IMAGE
// ============================================================

class _MessageImageBox extends StatelessWidget {
  final AutoDmController controller;

  const _MessageImageBox({required this.controller});

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image == null) {
      return;
    }

    controller.setDmImage(File(image.path));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppResponsive.r(14)),
        border: Border.all(color: const Color(0xFFD6B8FF)),
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
            child: Obx(() {
              final File? image = controller.selectedDmImage.value;

              if (image != null) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppResponsive.r(12)),
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
              );
            }),
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
                filled: true,
                fillColor: Colors.transparent,
                counterText: '',
                isDense: true,
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

          Container(height: 1, color: const Color(0xFFEFEFEF)),

          InkWell(
            onTap: () {
              _showAddLinkSheet(context);
            },
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

// ============================================================
// SWITCH
// ============================================================

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
      borderRadius: BorderRadius.circular(AppResponsive.r(12)),
      child: Container(
        height: AppResponsive.h(34),
        padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(12)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppResponsive.r(12)),
          border: Border.all(color: const Color(0xFFD9D9D9)),
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
              padding: EdgeInsets.all(AppResponsive.w(2)),
              decoration: BoxDecoration(
                color: value ? AppColors.primary : const Color(0xFFEDEDED),
                borderRadius: BorderRadius.circular(30),
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
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
                    color: value ? AppColors.primary : Colors.grey,
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

// ============================================================
// FOLLOW BEFORE DM SHEET
// ============================================================

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
        top: Radius.circular(AppResponsive.r(18)),
      ),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          left: AppResponsive.w(20),
          right: AppResponsive.w(20),
          top: AppResponsive.h(18),
          bottom:
              MediaQuery.of(context).viewInsets.bottom + AppResponsive.h(24),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Ask to follow before DM',
                    style: AppTextStyles.heading.copyWith(
                      fontSize: AppResponsive.sp(15),
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: Get.back,
                    child: Icon(
                      Icons.close,
                      size: AppResponsive.sp(20),
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppResponsive.h(16)),

              _FollowEditableCard(
                title: controller.followMessage1,
                description: controller.followDescription1,
                visitButton: controller.visitProfileButton1,
                followingButton: controller.followingButton1,
              ),

              SizedBox(height: AppResponsive.h(10)),

              _FollowEditableCard(
                title: controller.followMessage2,
                description: controller.followDescription2,
                visitButton: controller.visitProfileButton2,
                followingButton: controller.followingButton2,
              ),

              SizedBox(height: AppResponsive.h(22)),

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

// ============================================================
// FOLLOW CARD
// ============================================================

class _FollowEditableCard extends StatelessWidget {
  final RxString title;
  final RxString description;
  final RxString visitButton;
  final RxString followingButton;

  const _FollowEditableCard({
    required this.title,
    required this.description,
    required this.visitButton,
    required this.followingButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppResponsive.w(10)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppResponsive.r(10)),
        border: Border.all(color: const Color(0xFFD8D8D8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ReactiveEditableText(
            value: title,
            maxLines: 1,
            fontSize: 10,
            color: const Color(0xFF9A9A9A),
          ),

          SizedBox(height: AppResponsive.h(5)),

          _ReactiveEditableText(
            value: description,
            maxLines: 4,
            fontSize: 10,
            color: const Color(0xFF666666),
          ),

          SizedBox(height: AppResponsive.h(8)),

          _EditableFollowButton(value: visitButton),

          SizedBox(height: AppResponsive.h(6)),

          _EditableFollowButton(value: followingButton),
        ],
      ),
    );
  }
}

// ============================================================
// TRANSPARENT EDITABLE TEXT
// ============================================================

class _ReactiveEditableText extends StatefulWidget {
  final RxString value;
  final int maxLines;
  final double fontSize;
  final Color color;

  const _ReactiveEditableText({
    required this.value,
    required this.maxLines,
    required this.fontSize,
    required this.color,
  });

  @override
  State<_ReactiveEditableText> createState() => _ReactiveEditableTextState();
}

class _ReactiveEditableTextState extends State<_ReactiveEditableText> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();

    textController = TextEditingController(text: widget.value.value);
  }

  @override
  void didUpdateWidget(covariant _ReactiveEditableText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value.value != textController.text) {
      textController.text = widget.value.value;

      textController.selection = TextSelection.collapsed(
        offset: textController.text.length,
      );
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      maxLines: widget.maxLines,
      minLines: 1,
      cursorColor: AppColors.primary,
      onChanged: (value) {
        widget.value.value = value;
      },
      style: AppTextStyles.caption.copyWith(
        fontSize: AppResponsive.sp(widget.fontSize),
        color: widget.color,
        height: 1.25,
      ),
      decoration: const InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

// ============================================================
// EDITABLE BUTTON
// ============================================================

// ============================================================
// EDITABLE FOLLOW BUTTON
// ============================================================

class _EditableFollowButton extends StatelessWidget {
  final RxString value;

  const _EditableFollowButton({required this.value});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: AppResponsive.h(31),
        padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(12)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppResponsive.r(8)),
          border: Border.all(color: const Color(0xFFD0D0D0)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value.value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.inputText.copyWith(
                  fontSize: AppResponsive.sp(11),
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),

            SizedBox(width: AppResponsive.w(8)),

            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                showEditFollowButtonSheet(context: context, value: value);
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
    );
  }
}

// ============================================================
// EDIT FOLLOW BUTTON BOTTOM SHEET
// ============================================================

void showEditFollowButtonSheet({
  required BuildContext context,
  required RxString value,
}) {
  final TextEditingController editController = TextEditingController(
    text: value.value,
  );

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppResponsive.r(18)),
      ),
    ),
    builder: (sheetContext) {
      return _EditFollowButtonSheet(controller: editController, value: value);
    },
  ).whenComplete(() {
    editController.dispose();
  });
}

// ============================================================
// EDIT FOLLOW BUTTON SHEET
// ============================================================

class _EditFollowButtonSheet extends StatefulWidget {
  final TextEditingController controller;
  final RxString value;

  const _EditFollowButtonSheet({required this.controller, required this.value});

  @override
  State<_EditFollowButtonSheet> createState() => _EditFollowButtonSheetState();
}

class _EditFollowButtonSheetState extends State<_EditFollowButtonSheet> {
  int characterCount = 0;

  @override
  void initState() {
    super.initState();

    characterCount = widget.controller.text.length;

    widget.controller.addListener(_updateCharacterCount);
  }

  void _updateCharacterCount() {
    if (!mounted) {
      return;
    }

    setState(() {
      characterCount = widget.controller.text.length;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateCharacterCount);

    super.dispose();
  }

  void _saveButtonText() {
    final String text = widget.controller.text.trim();

    if (text.isEmpty) {
      Get.snackbar(
        'Button text required',
        'Please enter button text.',
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    widget.value.value = text;

    Get.back();
  }

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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Edit button',
                  style: AppTextStyles.heading.copyWith(
                    fontSize: AppResponsive.sp(16),
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
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

            SizedBox(height: AppResponsive.h(24)),

            TextField(
              controller: widget.controller,
              maxLength: 60,
              cursorColor: AppColors.primary,
              textAlign: TextAlign.center,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) {
                _saveButtonText();
              },
              style: AppTextStyles.inputText.copyWith(
                fontSize: AppResponsive.sp(13),
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              decoration: InputDecoration(
                counterText: '',
                hintText: 'Button Text',
                hintStyle: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(13),
                  color: const Color(0xFF9E9E9E),
                ),
                prefixIcon: Icon(
                  Icons.text_fields,
                  size: AppResponsive.sp(18),
                  color: const Color(0xFF777777),
                ),
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
                  borderSide: const BorderSide(
                    color: Color(0xFFA774FF),
                    width: 1.2,
                  ),
                ),
              ),
            ),

            SizedBox(height: AppResponsive.h(5)),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$characterCount/60',
                style: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(9),
                  color: const Color(0xFFAAAAAA),
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

            SizedBox(height: AppResponsive.h(32)),

            SizedBox(
              width: double.infinity,
              height: AppResponsive.h(45),
              child: GradientButton(
                label: 'Save Message',
                onTap: _saveButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ============================================================
// ADD LINK
// ============================================================

void _showAddLinkSheet(BuildContext context) {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController linkController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppResponsive.r(18)),
      ),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          left: AppResponsive.w(20),
          right: AppResponsive.w(20),
          top: AppResponsive.h(18),
          bottom:
              MediaQuery.of(context).viewInsets.bottom + AppResponsive.h(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'Add Link',
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

            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Enter Title'),
            ),

            SizedBox(height: AppResponsive.h(10)),

            TextField(
              controller: linkController,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(hintText: 'Enter Link'),
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
  ).whenComplete(() {
    titleController.dispose();
    linkController.dispose();
  });
}

// ============================================================
// OPENING MESSAGE
// ============================================================

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
