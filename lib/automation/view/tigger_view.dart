import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/app_responsive.dart';
import '../../core/constant/app_text.dart';
import '../../core/constant/routes/app_routes.dart';
import '../../core/widget/app_bar.dart';
import '../../core/widget/gradient_button.dart';
import '../../core/widget/tiggeroptiontile.dart';
import '../controller/autodm_con.dart';


class TriggerTypeScreen extends StatelessWidget {
  const TriggerTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    final AutoDmController c = Get.find<AutoDmController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(title: 'Smart Auto DM'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(14)),
          child: Column(
            children: [
              SizedBox(height: AppResponsive.h(20)),

              Center(
                child: Text(
                  'Choose trigger type',
                  style: AppTextStyles.heading.copyWith(
                    fontSize: AppResponsive.sp(13),
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ),

              SizedBox(height: AppResponsive.h(6)),

              Center(
                child: Text(
                  'Select when you want the auto Dm to start',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subHeading.copyWith(
                    fontSize: AppResponsive.sp(9),
                    color: AppColors.greyText,
                  ),
                ),
              ),

              SizedBox(height: AppResponsive.h(22)),

              Obx(
                    () => Column(
                  children: [
                    TriggerOptionTile(
                      icon: Icons.chat_bubble_outline_rounded,
                      title: 'Comment on post or reel',
                      subtitle:
                      'sent auto Dm when someone comment\non your post or reel',
                      selected:
                      c.selectedTrigger.value == TriggerType.commentOnPost,
                      popular: true,
                      onTap: () =>
                          c.selectTrigger(TriggerType.commentOnPost),
                    ),
                    SizedBox(height: AppResponsive.h(12)),
                    TriggerOptionTile(
                      icon: Icons.send_rounded,
                      title: 'DM Keywords',
                      subtitle:
                      'Sent auto reply when someone sent a DM\nwith specific keywords',
                      selected:
                      c.selectedTrigger.value == TriggerType.dmKeywords,
                      onTap: () => c.selectTrigger(TriggerType.dmKeywords),
                    ),
                    SizedBox(height: AppResponsive.h(12)),
                    TriggerOptionTile(
                      icon: Icons.add_rounded,
                      title: 'Story reply',
                      subtitle:
                      'Sent auto DM when someone reply to\nyour story',
                      selected:
                      c.selectedTrigger.value == TriggerType.storyReply,
                      onTap: () => c.selectTrigger(TriggerType.storyReply),
                    ),
                    SizedBox(height: AppResponsive.h(12)),
                    TriggerOptionTile(
                      icon: Icons.reply_rounded,
                      title: 'Auto reply',
                      subtitle:
                      'Reply to every comment naturally without\ntyping manually.',
                      selected:
                      c.selectedTrigger.value == TriggerType.autoReply,
                      onTap: () => c.selectTrigger(TriggerType.autoReply),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Padding(
                padding: EdgeInsets.only(
                  left: AppResponsive.w(22),
                  right: AppResponsive.w(22),
                  bottom: AppResponsive.h(72),
                ),
                child: SizedBox(
                  height: AppResponsive.h(45),
                  child: GradientButton(
                    label: 'Next',
                    onTap: () => Get.toNamed(AppRoutes.selectPost),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}