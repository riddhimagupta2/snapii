import 'package:get/get.dart';

import '../../dashbaord/controller/brand_controller.dart';
import '../controller/brand_navigation_controller.dart';

class BrandNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrandNavigationController>(
          () => BrandNavigationController(),
    );

    Get.lazyPut<BrandDashboardController>(
          () => BrandDashboardController(),
    );
  }
}