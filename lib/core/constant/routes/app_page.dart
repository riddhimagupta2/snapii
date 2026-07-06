import 'package:get/get.dart';

import '../../../feature/auth/binding/auth_binding.dart';
import '../../../feature/auth/binding/onboarding_binding.dart';
import '../../../feature/auth/binding/role_selection_binding.dart';
import '../../../feature/auth/view/login.dart';
import '../../../feature/auth/view/onboarding_screen.dart';
import '../../../feature/auth/view/registration_screen.dart';
import '../../../feature/auth/view/role_selection_screen.dart';

import '../../../feature/brand/dashbaord/binding/brand_binding.dart';
import '../../../feature/brand/dashbaord/view/brand_dashboard_screen.dart';
import '../../../feature/brand/navigation/binding/brand_navigation_binding.dart';
import '../../../feature/brand/navigation/view/brand_navigation_screen.dart';
import '../../../feature/smart auto dm/automation/binding/auto_binding.dart';
import '../../../feature/smart auto dm/automation/view/automation_detail_screen.dart';
import '../../../feature/smart auto dm/automation/view/automation_home.dart';
import '../../../feature/smart auto dm/automation/view/automation_screen.dart';
import '../../../feature/smart auto dm/automation/view/tigger_view.dart';
import '../../../feature/smart auto dm/comment/option_action.dart';
import '../../../feature/smart auto dm/comment/preview_auto.dart';
import '../../../feature/smart auto dm/comment/reply.dart';
import '../../../feature/smart auto dm/comment/select.dart';
import '../../../feature/smart auto dm/comment/sendDm_preview.dart';
import '../../../feature/smart auto dm/comment/send_dm.dart';
import '../../../feature/smart auto dm/reply/controller/reply.cont.dart';
import '../../../feature/smart auto dm/reply/view/auto_reply_setup.dart';
import '../../../feature/smart auto dm/reply/view/reply_preview.dart';

import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String initial = AppRoutes.onboarding;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),

    GetPage(
      name: AppRoutes.roleSelection,
      page: () => const RoleSelectionScreen(),
      binding: RoleSelectionBinding(),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () =>  LoginScreen(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.registration,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.brandDashboard,
      page: () => const BrandNavigationScreen(),
      binding: BrandNavigationBinding(),
    ),

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

    GetPage(
      name: AppRoutes.sendAdm,
      page: () => const SendDmScreen(),
      binding: AutoDmBinding(),
    ),

    GetPage(
      name: AppRoutes.sendmPreview,
      page: () => const FollowBeforeDmScreen(),
    ),

    GetPage(
      name: AppRoutes.optionalAction,
      page: () => const OptionalActionScreen(),
    ),

    GetPage(
      name: AppRoutes.previewAuto,
      page: () => const PreviewAutomationScreen(),
    ),

    GetPage(
      name: AppRoutes.autoScreen,
      page: () => const AutomationListScreen(),
    ),

    GetPage(
      name: AppRoutes.automationDetail,
      page: () => const AutomationDetailScreen(),
    ),

    GetPage(
      name: AppRoutes.autoReplySetup,
      page: () => const AutoReplySetupScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AutoReplySetupController>(
              () => AutoReplySetupController(),
        );
      }),
    ),

    GetPage(
      name: AppRoutes.replyPreview,
      page: () => const PreviewScreen(),
    ),
  ];
}