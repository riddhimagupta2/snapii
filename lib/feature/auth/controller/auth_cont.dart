import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes/app_routes.dart';


class AuthController extends GetxController {
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();

  final isLoginLoading = false.obs;
  final isRegisterLoading = false.obs;
  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPassword() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  void goToRegister() {
    FocusManager.instance.primaryFocus?.unfocus();

    Future.delayed(const Duration(milliseconds: 100), () {
      Get.offNamed(AppRoutes.registration);
    });
  }

  void goToLogin() {
    FocusManager.instance.primaryFocus?.unfocus();

    Future.delayed(const Duration(milliseconds: 100), () {
      Get.offNamed(AppRoutes.login);
    });
  }

  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final email = loginEmailController.text.trim();
    final password = loginPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password');
      return;
    }

    try {
      isLoginLoading.value = true;

      await Future.delayed(const Duration(seconds: 1));

      Get.offAllNamed(AppRoutes.brandDashboard);
    } catch (e) {
      Get.snackbar('Login Failed', e.toString());
    } finally {
      isLoginLoading.value = false;
    }
  }

  Future<void> register() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final name = registerNameController.text.trim();
    final email = registerEmailController.text.trim();
    final password = registerPasswordController.text.trim();
    final confirmPassword = registerConfirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    try {
      isRegisterLoading.value = true;

      await Future.delayed(const Duration(seconds: 1));

      Get.offAllNamed(AppRoutes.brandDashboard);
    } catch (e) {
      Get.snackbar('Registration Failed', e.toString());
    } finally {
      isRegisterLoading.value = false;
    }
  }

  @override
  void onClose() {
    // Do not dispose controllers here if same controller is used across login/register routes.
    super.onClose();
  }
}