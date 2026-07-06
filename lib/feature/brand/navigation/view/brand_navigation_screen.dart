import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_responsive.dart';
import '../../../../core/widget/custom_nav.dart';
import '../../dashbaord/view/brand_dashboard_screen.dart';
import '../controller/brand_navigation_controller.dart';

class BrandNavigationScreen extends GetView<BrandNavigationController> {
  const BrandNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            physics: const BouncingScrollPhysics(),
            children: const [
              BrandDashboardScreen(),
              _CampaignScreen(),
              _AutomationScreen(),
              _ChatScreen(),
              _ProfileScreen(),
            ],
          ),

          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNav(),
          ),
        ],
      ),
    );
  }
}

class _CampaignScreen extends StatelessWidget {
  const _CampaignScreen();

  @override
  Widget build(BuildContext context) {
    return const _EmptyPage(
      title: 'Campaign',
    );
  }
}

class _AutomationScreen extends StatelessWidget {
  const _AutomationScreen();

  @override
  Widget build(BuildContext context) {
    return const _EmptyPage(
      title: 'Smart Auto DM',
    );
  }
}

class _ChatScreen extends StatelessWidget {
  const _ChatScreen();

  @override
  Widget build(BuildContext context) {
    return const _EmptyPage(
      title: 'Chat',
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen();

  @override
  Widget build(BuildContext context) {
    return const _EmptyPage(
      title: 'Profile',
    );
  }
}

class _EmptyPage extends StatelessWidget {
  final String title;

  const _EmptyPage({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(title),
      ),
    );
  }
}