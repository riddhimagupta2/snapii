import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AutoReplySetupController extends GetxController {
  final RxBool allPosts = false.obs;
  final RxBool repliesPerReel = false.obs;
  final RxBool autoLikeComments = false.obs;

  final RxInt selectedPostIndex = 1.obs;

  final RxDouble replyDelay = 15.0.obs;
  final RxInt selectedDelayOption = 15.obs;

  final RxDouble repliesPerReelLimit = 100.0.obs;
  final RxDouble autoLikeLimit = 100.0.obs;

  final TextEditingController automationNameController =
  TextEditingController();

  void toggleAllPosts(bool value) => allPosts.value = value;

  void toggleRepliesPerReel(bool value) => repliesPerReel.value = value;

  void toggleAutoLikeComments(bool value) => autoLikeComments.value = value;

  void selectPost(int index) => selectedPostIndex.value = index;

  void setReplyDelay(double value) => replyDelay.value = value;

  void selectDelayOption(int value) {
    selectedDelayOption.value = value;
    replyDelay.value = value.toDouble();
  }

  void setRepliesPerReelLimit(double value) {
    repliesPerReelLimit.value = value;
  }

  void setAutoLikeLimit(double value) {
    autoLikeLimit.value = value;
  }

  @override
  void onClose() {
    automationNameController.dispose();
    super.onClose();
  }
}