import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_responsive.dart';
import '../../../core/constant/app_text.dart';
import '../../../core/widget/custom_textfield.dart';
import '../../../core/widget/gradient_button.dart';
import '../controller/auth_cont.dart';
import '../widget.dart';

class RegistrationScreen extends GetView<AuthController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const AuthTopBackground(),

          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppResponsive.w(54),
            ),
            child: Form(
              key: controller.signUpKey,
              child: Column(
                children: [
                  SizedBox(
                    height: AppResponsive.h(142),
                  ),

                  Text(
                    'Create Account',
                    style: AppTextStyles.heading.copyWith(
                      fontSize: AppResponsive.sp(18),
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(
                    height: AppResponsive.h(38),
                  ),

                  CustomTextField(
                    label: 'Name',
                    hint: 'John Doe',
                    controller: controller.nameController,
                    validator: controller.validateName,
                  ),

                  SizedBox(
                    height: AppResponsive.h(17),
                  ),

                  CustomTextField(
                    label: 'Phone Number',
                    hint: 'Enter Phone Number',
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    validator: controller.validatePhone,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: AppResponsive.w(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '+1',
                            style: AppTextStyles.inputText.copyWith(
                              fontSize: AppResponsive.sp(11),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: AppResponsive.sp(15),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: AppResponsive.h(17),
                  ),

                  CustomTextField(
                    label: 'Email',
                    hint: 'Doe12@gmail.com',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: controller.validateEmail,
                  ),

                  SizedBox(
                    height: AppResponsive.h(17),
                  ),

                  Obx(
                        () => CustomTextField(
                      label: 'Password',
                      hint: '********',
                      controller: controller.passwordController,
                      obscureText: controller.hidePassword.value,
                      validator: controller.validatePassword,
                      suffixIcon: IconButton(
                        onPressed: controller.togglePassword,
                        icon: Icon(
                          controller.hidePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: AppResponsive.sp(16),
                          color: AppColors.greyText,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: AppResponsive.h(8),
                  ),

                  Obx(
                        () => Row(
                      children: [
                        GestureDetector(
                          onTap: controller.toggleTerms,
                          child: Icon(
                            controller.agreeTerms.value
                                ? Icons.check_box_outlined
                                : Icons.check_box_outline_blank,
                            size: AppResponsive.sp(18),
                            color: controller.agreeTerms.value
                                ? Colors.green
                                : AppColors.black,
                          ),
                        ),

                        SizedBox(
                          width: AppResponsive.w(5),
                        ),

                        Text(
                          'Agree with ',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.black,
                            fontSize: AppResponsive.sp(10),
                          ),
                        ),

                        Text(
                          'Term & Condition',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.primary,
                            fontSize: AppResponsive.sp(10),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: AppResponsive.h(42),
                  ),

                  Obx(
                        () => GradientButton(
                      label: controller.isLoading.value
                          ? 'Please wait...'
                          : 'Sign Up',
                      isOutlined: true,
                      height: AppResponsive.h(45),
                      onTap: controller.isLoading.value
                          ? null
                          : controller.signUp,
                    ),
                  ),

                  SizedBox(
                    height: AppResponsive.h(18),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.black,
                          fontSize: AppResponsive.sp(10),
                        ),
                      ),
                      GestureDetector(
                        onTap: controller.goToLogin,
                        child: Text(
                          'Login',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.primary,
                            fontSize: AppResponsive.sp(10),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: AppResponsive.h(28),
                  ),

                  Container(
                    width: AppResponsive.w(32),
                    height: AppResponsive.w(32),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.primarySelectedBg,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      'G',
                      style: AppTextStyles.heading.copyWith(
                        color: AppColors.primary,
                        fontSize: AppResponsive.sp(19),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: AppResponsive.h(30),
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