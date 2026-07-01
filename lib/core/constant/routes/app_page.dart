import 'package:get/get.dart';
import '../../../automation/binding/auto_binding.dart';
import '../../../automation/view/automation_home.dart';
import '../../../automation/view/tigger_view.dart';
import '../../../comment/select.dart';
import '../../../comment/reply.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String initial = AppRoutes.liveAutomationPreview;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.liveAutomationPreview,
      page: () => const LiveAutomationPreviewScreen(),
      binding: AutoDmBinding(),
    ),
    GetPage(
      name: AppRoutes.triggerType,
      page: () => const TriggerTypeScreen(),
      binding: AutoDmBinding(),
    ),
    GetPage(
      name: AppRoutes.selectPost,
      page: () => const SelectPostScreen(),
      binding: AutoDmBinding(),
    ),
    GetPage(
      name: AppRoutes.replyTo,
      page: () => const ReplyToScreen(),
      binding: AutoDmBinding(),
    ),
  ];
}