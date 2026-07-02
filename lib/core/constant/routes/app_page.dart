import 'package:get/get.dart';
import 'package:intership/comment/send_dm.dart';
import '../../../automation/binding/auto_binding.dart';
import '../../../automation/view/automation_home.dart';
import '../../../automation/view/tigger_view.dart';
import '../../../comment/select.dart';
import '../../../comment/reply.dart';
import '../../../comment/sendDm_preview.dart';
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
    ),GetPage(
      name: AppRoutes.sendAdm,
      page: () => const SendDmScreen(),
      binding: AutoDmBinding(),
    ),GetPage(
      name: AppRoutes.sendmPreview,
      page: () => const FollowBeforeDmScreen(),
    ),
  ];
}