import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentIndex = 0.obs;

  final List<OnboardingItem> pages = const [
    OnboardingItem(
      image: 'assets/images/on_b1.png',
      title: 'Earn from Content',
      description:
      'Paid campaigns, creator services, and direct brand opportunities to grow your income faster.',
    ),
    OnboardingItem(
      image: 'assets/images/on_b2.png',
      title: 'Grow with AI',
      description:
      'Smart tools, trends, analytics, and automation designed for faster creator and brand growth.',
    ),
    OnboardingItem(
      image: 'assets/images/on_b3.png',
      title: 'Safe & Powerful',
      description:
      'Secure payments, trusted collaborations, verified users, and everything in one powerful platform.',
    ),
  ];

  bool get isLastPage => currentIndex.value == pages.length - 1;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (isLastPage) {
      Get.offAllNamed(AppRoutes.roleSelection);
      return;
    }

    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void skip() {
    Get.offAllNamed(AppRoutes.roleSelection);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  const OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}