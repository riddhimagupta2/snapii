// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../core/constant/routes/app_routes.dart';
//
// class RoleSelectionController extends GetxController {
//   final RxString selectedRole = ''.obs;
//
//   Future<void> selectRole(String role) async {
//     selectedRole.value = role;
//
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('user_role', role);
//
//     Get.toNamed(AppRoutes.registration);
//   }
//
//   bool isSelected(String role) {
//     return selectedRole.value == role;
//   }
// }

import 'package:get/get.dart';

import '../../../core/constant/routes/app_routes.dart';

class RoleSelectionController extends GetxController {
  final RxString selectedRole = 'brand'.obs;

  void selectRole(String role) {
    selectedRole.value = role;
    Get.offAllNamed(AppRoutes.registration);
  }

  bool isSelected(String role) {
    return selectedRole.value == role;
  }
}