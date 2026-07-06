import 'package:get/get.dart';
import '../controller/brand_controller.dart';

class BrandDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrandDashboardController>(
          () => BrandDashboardController(),
    );
  }
}