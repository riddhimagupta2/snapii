import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/tigger_view.dart';

enum TriggerType { commentOnPost, dmKeywords, storyReply, autoReply }

enum ReplyToType { anyComment, specificKeywords }

class AutoDmController extends GetxController {
  final RxBool openingMessageEnabled = false.obs;
  final RxBool followBeforeDmEnabled = false.obs;

  final TextEditingController messageController = TextEditingController();

  final Rxn<File> selectedDmImage = Rxn<File>();

  final RxBool anyCommentEnabled = true.obs;

  void toggleAnyComment() {
    anyCommentEnabled.value = !anyCommentEnabled.value;

    if (anyCommentEnabled.value) {
      selectedReplyTo.value = ReplyToType.anyComment;
    }
  }

  void setDmImage(File file) {
    selectedDmImage.value = file;
  }

  void removeDmImage() {
    selectedDmImage.value = null;
  }

  final RxString followMessage1 = 'Before I send the details 🥰'.obs;

  final RxString followDescription1 =
      'Please follow the profile first, then tap\n"I’m Following" below to continue ✨'
          .obs;

  final RxString followMessage2 =
      'It looks like the profile hasn’t been followed yet 😊'.obs;

  final RxString followDescription2 =
      'Follow the account first to unlock your access 🚀'.obs;

  void toggleOpeningMessage(bool value) {
    openingMessageEnabled.value = value;
  }

  void toggleFollowBeforeDm(bool value) {
    followBeforeDmEnabled.value = value;
  }

  final RxBool showAddPublicReplyField = false.obs;

  void openPublicReplyField() {
    showAddPublicReplyField.value = true;
  }

  void closePublicReplyField() {
    showAddPublicReplyField.value = false;
    publicReplyController.clear();
  }

  final Rx<TriggerType> selectedTrigger = TriggerType.commentOnPost.obs;

  void selectTrigger(TriggerType type) {
    selectedTrigger.value = type;
  }

  final RxBool replyPubliclyEnabled = false.obs;

  void toggleReplyPublicly(bool value) {
    replyPubliclyEnabled.value = value;
  }

  final TextEditingController publicReplyController = TextEditingController();

  final RxList<String> publicReplies = <String>[
    'Thanks! Just sent it to your DM 🚀',
    'Check your inbox ✨',
    'Done ✅ Sent you the details in DM',
    'Your message is waiting in DM 👀',
    'Just shared everything with you 😊',
  ].obs;

  void addPublicReplyFromInput() {
    final String text = publicReplyController.text.trim();

    if (text.isEmpty) {
      return;
    }

    publicReplies.add(text);

    publicReplyController.clear();
  }

  void removePublicReply(int index) {
    if (index < 0 || index >= publicReplies.length) {
      return;
    }

    publicReplies.removeAt(index);
  }

  final RxInt selectedPostIndex = 0.obs;

  void selectPost(int index) {
    selectedPostIndex.value = index;
  }

  final RxString automationName = ''.obs;

  void setAutomationName(String value) {
    automationName.value = value;
  }

  final RxBool showAllPosts = true.obs;

  void toggleShowAllPosts(bool value) {
    showAllPosts.value = value;
  }

  final Rx<ReplyToType> selectedReplyTo = ReplyToType.anyComment.obs;

  void selectReplyTo(ReplyToType type) {
    selectedReplyTo.value = type;
  }

  final TextEditingController keywordController = TextEditingController();

  final RxList<String> keywords = <String>[].obs;

  void addKeyword() {
    final String text = keywordController.text.trim();

    if (text.isEmpty) {
      return;
    }

    final bool alreadyExists = keywords.any(
      (keyword) => keyword.toLowerCase() == text.toLowerCase(),
    );

    if (!alreadyExists) {
      keywords.add(text);
    }

    keywordController.clear();
  }

  void removeKeyword(String keyword) {
    keywords.remove(keyword);
  }

  final RxString message = ''.obs;

  void setMessage(String value) {
    message.value = value;
  }

  void goToTriggerType() {
    Get.to(() => const TriggerTypeScreen());
  }

  void reset() {
    openingMessageEnabled.value = false;
    followBeforeDmEnabled.value = false;

    selectedTrigger.value = TriggerType.commentOnPost;

    replyPubliclyEnabled.value = false;

    selectedPostIndex.value = 0;

    automationName.value = '';

    showAllPosts.value = true;

    selectedReplyTo.value = ReplyToType.anyComment;
    showAddPublicReplyField.value = false;
    publicReplyController.clear();

    keywords.clear();
    keywordController.clear();

    message.value = '';

    publicReplyController.clear();

    message.value = '';
    messageController.clear();
    selectedDmImage.value = null;

    followMessage1.value = 'Before I send the details 🥰';
    followDescription1.value =
    'Please follow the profile first, then tap\n"I’m Following" below to continue ✨';

    followMessage2.value =
    'It looks like the profile hasn’t been followed yet 😊';
    followDescription2.value =
    'Follow the account first to unlock your access 🚀';

    publicReplies.assignAll([
      'Thanks! Just sent it to your DM 🚀',
      'Check your inbox ✨',
      'Done ✅ Sent you the details in DM',
      'Your message is waiting in DM 👀',
      'Just shared everything with you 😊',
    ]);
  }

  @override
  void onClose() {
    keywordController.dispose();
    publicReplyController.dispose();
    messageController.dispose();

    super.onClose();
  }
}
