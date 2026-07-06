import 'package:get/get.dart';

class BrandDashboardController extends GetxController {
  final RxString userName = 'Kumar'.obs;

  final RxBool isLoading = false.obs;

  String get joinedText {
    return '@${userName.value} joined';
  }

  @override
  void onInit() {
    super.onInit();
    fetchDashboard();
  }

  Future<void> fetchDashboard() async {
    isLoading.value = true;

    try {
      await fetchUserProfile();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchUserProfile() async {
    // TODO: backend API integration.

    userName.value = 'Kumar';
  }
}