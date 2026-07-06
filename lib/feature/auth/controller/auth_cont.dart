import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/routes/app_routes.dart';

class AuthController extends GetxController {
  final signUpKey = GlobalKey<FormState>();
  final loginKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  final hidePassword = true.obs;
  final hideLoginPassword = true.obs;
  final agreeTerms = false.obs;
  final isLoading = false.obs;

  void togglePassword() {
    hidePassword.toggle();
  }

  void toggleLoginPassword() {
    hideLoginPassword.toggle();
  }

  void toggleTerms() {
    agreeTerms.toggle();
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    if (!GetUtils.isEmail(value.trim())) {
      return 'Enter valid email';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Minimum 6 characters required';
    }

    return null;
  }

  Future<void> signUp() async {
    if (!(signUpKey.currentState?.validate() ?? false)) {
      return;
    }

    if (!agreeTerms.value) {
      Get.snackbar(
        'Terms & Condition',
        'Please agree with Terms & Condition',
      );
      return;
    }

    isLoading.value = true;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'user_name',
      nameController.text.trim(),
    );

    await prefs.setString(
      'user_email',
      emailController.text.trim(),
    );

    await prefs.setString(
      'user_phone',
      phoneController.text.trim(),
    );

    await prefs.setBool('is_new_user', false);
    await prefs.setBool('is_logged_in', true);

    isLoading.value = false;

    _navigateToDashboard(prefs);
  }

  Future<void> login() async {
    if (!(loginKey.currentState?.validate() ?? false)) {
      return;
    }

    isLoading.value = true;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('is_new_user', false);
    await prefs.setBool('is_logged_in', true);

    isLoading.value = false;

    _navigateToDashboard(prefs);
  }

  void _navigateToDashboard(
      SharedPreferences prefs,
      ) {
    final role = prefs.getString('user_role') ?? 'brand';

    switch (role) {
      case 'creator':
        Get.offAllNamed(AppRoutes.brandDashboard);
        break;

      case 'agency':
        Get.offAllNamed(AppRoutes.brandDashboard);
        break;

      default:
        Get.offAllNamed(AppRoutes.brandDashboard);
    }
  }

  void goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  void goToRegistration() {
    Get.toNamed(AppRoutes.registration);
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();

    loginEmailController.dispose();
    loginPasswordController.dispose();

    super.onClose();
  }
}