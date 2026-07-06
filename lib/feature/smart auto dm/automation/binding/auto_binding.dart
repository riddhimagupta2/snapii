import 'package:get/get.dart';

import '../controller/autodm_con.dart';

class AutoDmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AutoDmController>(() => AutoDmController(), fenix: true);
  }
}