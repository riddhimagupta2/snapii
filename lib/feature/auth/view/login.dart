import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_responsive.dart';
import '../../../core/constant/app_text.dart';
import '../../../core/widget/custom_textfield.dart';
import '../../../core/widget/gradient_button.dart';
import '../controller/auth_cont.dart';
import '../widget.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

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
              key: controller.loginKey,
              child: Column(
                children: [
                  SizedBox(
                    height: AppResponsive.h(165),
                  ),

                  Text(
                    'Login',
                    style: AppTextStyles.heading.copyWith(
                      fontSize: AppResponsive.sp(18),
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(
                    height: AppResponsive.h(70),
                  ),

                  CustomTextField(
                    label: 'Email',
                    hint: 'John Doe',
                    controller: controller.loginEmailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: controller.validateEmail,
                  ),

                  SizedBox(
                    height: AppResponsive.h(28),
                  ),

                  Obx(
                        () => CustomTextField(
                      label: 'Password',
                      hint: '********',
                      controller: controller.loginPasswordController,
                      obscureText: controller.hideLoginPassword.value,
                      validator: controller.validatePassword,
                      suffixIcon: IconButton(
                        onPressed: controller.toggleLoginPassword,
                        icon: Icon(
                          controller.hideLoginPassword.value
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

                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot Password',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.black,
                          fontSize: AppResponsive.sp(10),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: AppResponsive.h(50),
                  ),

                  Obx(
                        () => GradientButton(
                      label: controller.isLoading.value
                          ? 'Please wait...'
                          : 'Login',
                      isOutlined: true,
                      height: AppResponsive.h(45),
                      onTap: controller.isLoading.value
                          ? null
                          : controller.login,
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