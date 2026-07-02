import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/tigger_view.dart';

enum TriggerType {
  commentOnPost,
  dmKeywords,
  storyReply,
  autoReply,
}

enum ReplyToType {
  anyComment,
  specificKeywords,
}

class AutoDmController extends GetxController {

  final openingMessageEnabled = false.obs;
  final followBeforeDmEnabled = false.obs;
  /// Trigger
  final Rx<TriggerType> selectedTrigger =
      TriggerType.commentOnPost.obs;

  void selectTrigger(TriggerType type) {
    selectedTrigger.value = type;
  }

  /// Select Post
  final RxInt selectedPostIndex = 0.obs;

  void selectPost(int index) {
    selectedPostIndex.value = index;
  }

  /// Automation Name
  final RxString automationName = ''.obs;

  void setAutomationName(String value) {
    automationName.value = value;
  }

  /// All Posts Switch
  final RxBool showAllPosts = true.obs;

  void toggleShowAllPosts(bool value) {
    showAllPosts.value = value;
  }

  /// Reply To
  final Rx<ReplyToType> selectedReplyTo =
      ReplyToType.anyComment.obs;

  void selectReplyTo(ReplyToType type) {
    selectedReplyTo.value = type;
  }

  /// Keyword TextField
  final TextEditingController keywordController =
  TextEditingController();

  /// Keyword Chips
  final RxList<String> keywords = <String>[].obs;

  void addKeyword() {
    final text = keywordController.text.trim();

    if (text.isEmpty) return;

    if (!keywords.contains(text)) {
      keywords.add(text);
    }

    keywordController.clear();
  }

  void removeKeyword(String keyword) {
    keywords.remove(keyword);
  }

  /// Send DM Message
  final RxString message = ''.obs;

  void setMessage(String value) {
    message.value = value;
  }

  /// Navigation
  void goToTriggerType() {
    Get.to(() => const TriggerTypeScreen());
  }

  /// Reset
  void reset() {
    selectedTrigger.value = TriggerType.commentOnPost;
    selectedPostIndex.value = 0;
    automationName.value = '';
    showAllPosts.value = true;
    selectedReplyTo.value = ReplyToType.anyComment;
    keywords.clear();
    keywordController.clear();
    message.value = '';
  }

  @override
  void onClose() {
    keywordController.dispose();
    super.onClose();
  }
}