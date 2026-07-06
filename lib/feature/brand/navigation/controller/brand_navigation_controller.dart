import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandNavigationController extends GetxController {
  final PageController pageController = PageController();

  final RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    if (currentIndex.value == index) return;

    currentIndex.value = index;

    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  bool isSelected(int index) {
    return currentIndex.value == index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}