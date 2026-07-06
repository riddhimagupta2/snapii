import 'dart:io';

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
  final RxBool openingMessageEnabled = false.obs;
  final RxBool followBeforeDmEnabled = false.obs;

  final RxString message = ''.obs;
  final TextEditingController messageController = TextEditingController();
  final Rxn<File> selectedDmImage = Rxn<File>();

  void toggleOpeningMessage(bool value) {
    openingMessageEnabled.value = value;
  }

  void toggleFollowBeforeDm(bool value) {
    followBeforeDmEnabled.value = value;
  }

  void setMessage(String value) {
    message.value = value;
  }

  void setDmImage(File image) {
    selectedDmImage.value = image;
  }

  void removeDmImage() {
    selectedDmImage.value = null;
  }

  final RxString openingMessageText = '''Hey there 👋✨
Thanks a lot for reaching out — really excited to see your interest 😊
You’re just one step away from getting everything you need.
Tap below and I’ll send the details right over 🚀'''
      .obs;

  final RxString openingMessageButton = 'Send me the link'.obs;

  final RxString followMessage1 = 'Before I send the details 🥰'.obs;

  final RxString followDescription1 = '''Please follow the profile first, then tap
“I’m Following” below to continue ✨'''
      .obs;

  final RxString followMessage2 =
      'It looks like the profile hasn’t been followed yet 😊'.obs;

  final RxString followDescription2 =
      'Follow the account first to unlock your access 🚀'.obs;

  final RxString visitProfileButton1 = 'Visit Profile'.obs;
  final RxString followingButton1 = 'I’m Following ✅'.obs;
  final RxString visitProfileButton2 = 'Visit Profile'.obs;
  final RxString followingButton2 = 'I’m Following ✅'.obs;

  final RxBool replyPubliclyEnabled = false.obs;
  final RxBool showAddPublicReplyField = false.obs;

  final TextEditingController publicReplyController =
  TextEditingController();

  final RxList<String> publicReplies = <String>[
    'Thanks! Just sent it to your DM 🚀',
    'Check your inbox ✨',
    'Done ✅ Sent you the details in DM',
    'Your message is waiting in DM 👀',
    'Just shared everything with you 😊',
  ].obs;

  void toggleReplyPublicly(bool value) {
    replyPubliclyEnabled.value = value;
  }

  void openPublicReplyField() {
    showAddPublicReplyField.value = true;
  }

  void closePublicReplyField() {
    showAddPublicReplyField.value = false;
    publicReplyController.clear();
  }

  void addPublicReplyFromInput() {
    final String text = publicReplyController.text.trim();

    if (text.isEmpty) return;

    publicReplies.add(text);
    publicReplyController.clear();
    showAddPublicReplyField.value = false;
  }

  void removePublicReply(int index) {
    if (index < 0 || index >= publicReplies.length) return;
    publicReplies.removeAt(index);
  }

  final Rx<TriggerType> selectedTrigger = TriggerType.commentOnPost.obs;

  void selectTrigger(TriggerType type) {
    selectedTrigger.value = type;
  }

  final RxInt selectedPostIndex = 0.obs;
  final RxBool showAllPosts = true.obs;

  void selectPost(int index) {
    selectedPostIndex.value = index;
  }

  void toggleShowAllPosts(bool value) {
    showAllPosts.value = value;
  }

  final RxString automationName = ''.obs;

  void setAutomationName(String value) {
    automationName.value = value;
  }

  final Rx<ReplyToType> selectedReplyTo = ReplyToType.anyComment.obs;

  final RxBool anyCommentEnabled = true.obs;

  void selectReplyTo(ReplyToType type) {
    selectedReplyTo.value = type;

    if (type == ReplyToType.anyComment) {
      anyCommentEnabled.value = true;
    } else {
      anyCommentEnabled.value = false;
    }
  }

  void toggleAnyComment() {
    anyCommentEnabled.value = !anyCommentEnabled.value;

    if (anyCommentEnabled.value) {
      selectedReplyTo.value = ReplyToType.anyComment;
    } else {
      selectedReplyTo.value = ReplyToType.specificKeywords;
    }
  }

  final TextEditingController keywordController = TextEditingController();

  final RxList<String> keywords = <String>[].obs;

  void addKeyword() {
    final String text = keywordController.text.trim();

    if (text.isEmpty) return;

    anyCommentEnabled.value = false;
    selectedReplyTo.value = ReplyToType.specificKeywords;

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

    if (keywords.isEmpty) {
      anyCommentEnabled.value = true;
      selectedReplyTo.value = ReplyToType.anyComment;
    }
  }

  void goToTriggerType() {
    Get.to(() => const TriggerTypeScreen());
  }

  void reset() {
    openingMessageEnabled.value = false;
    followBeforeDmEnabled.value = false;

    message.value = '';
    messageController.clear();
    selectedDmImage.value = null;

    openingMessageText.value = '''Hey there 👋✨
Thanks a lot for reaching out — really excited to see your interest 😊
You’re just one step away from getting everything you need.
Tap below and I’ll send the details right over 🚀''';

    openingMessageButton.value = 'Send me the link';

    followMessage1.value = 'Before I send the details 🥰';

    followDescription1.value = '''Please follow the profile first, then tap
“I’m Following” below to continue ✨''';

    followMessage2.value =
    'It looks like the profile hasn’t been followed yet 😊';

    followDescription2.value =
    'Follow the account first to unlock your access 🚀';

    visitProfileButton1.value = 'Visit Profile';
    followingButton1.value = 'I’m Following ✅';
    visitProfileButton2.value = 'Visit Profile';
    followingButton2.value = 'I’m Following ✅';

    selectedTrigger.value = TriggerType.commentOnPost;

    selectedPostIndex.value = 0;
    showAllPosts.value = true;

    automationName.value = '';

    selectedReplyTo.value = ReplyToType.anyComment;
    anyCommentEnabled.value = true;

    keywords.clear();
    keywordController.clear();

    replyPubliclyEnabled.value = false;
    showAddPublicReplyField.value = false;
    publicReplyController.clear();

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