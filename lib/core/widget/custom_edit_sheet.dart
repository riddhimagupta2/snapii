import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_colors.dart';
import '../constant/app_responsive.dart';
import '../constant/app_text.dart';
import 'gradient_button.dart';

class CustomEditBottomSheet extends StatelessWidget {
  final String title;
  final String description;
  final TextEditingController controller;
  final String hintText;
  final String counterText;
  final Widget? prefixIcon;
  final VoidCallback onSave;

  const CustomEditBottomSheet({
    super.key,
    required this.title,
    required this.description,
    required this.controller,
    required this.onSave,
    this.hintText = "",
    this.counterText = "",
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppResponsive.w(18),
        AppResponsive.h(18),
        AppResponsive.w(18),
        AppResponsive.h(22),
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
                  fontSize: AppResponsive.sp(14),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: Get.back,
                child: Icon(
                  Icons.close,
                  size: AppResponsive.sp(18),
                ),
              )
            ],
          ),

          SizedBox(height: AppResponsive.h(8)),

          Text(
            description,
            style: AppTextStyles.subHeading.copyWith(
              fontSize: AppResponsive.sp(10),
              color: const Color(0xff8F8F8F),
              height: 1.3,
            ),
          ),

          SizedBox(height: AppResponsive.h(14)),

          TextField(
            controller: controller,
            style: AppTextStyles.inputText.copyWith(
              fontSize: AppResponsive.sp(12),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              hintText: hintText,
              prefixIcon: prefixIcon,
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppResponsive.w(12),
                vertical: AppResponsive.h(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  AppResponsive.r(10),
                ),
                borderSide: const BorderSide(
                  color: Color(0xffD9D9D9),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  AppResponsive.r(10),
                ),
                borderSide: const BorderSide(
                  color: Color(0xffD9D9D9),
                ),
              ),
            ),
          ),

          SizedBox(height: AppResponsive.h(6)),

          Padding(
            padding: EdgeInsets.only(
              left: AppResponsive.w(12),
            ),
            child: Text(
              counterText,
              style: AppTextStyles.subHeading.copyWith(
                fontSize: AppResponsive.sp(9),
                color: const Color(0xffB9B9B9),
              ),
            ),
          ),

          SizedBox(height: AppResponsive.h(18)),

          GradientButton(
            label: "Save",
            height: AppResponsive.h(44),
            onTap: onSave,
          ),
        ],
      ),
    );
  }
}