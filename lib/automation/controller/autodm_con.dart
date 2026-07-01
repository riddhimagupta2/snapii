import 'package:get/get.dart';

import '../view/tigger_view.dart';

enum TriggerType { commentOnPost, dmKeywords, storyReply, autoReply }

enum ReplyToType { anyComment, specificKeywords }

class AutoDmController extends GetxController {
  final Rx<TriggerType> selectedTrigger = TriggerType.commentOnPost.obs;

  void selectTrigger(TriggerType type) => selectedTrigger.value = type;

  final RxInt selectedPostIndex = 0.obs;
  final RxString automationName = ''.obs;
  final RxBool showAllPosts = true.obs;

  void selectPost(int index) => selectedPostIndex.value = index;
  void setAutomationName(String value) => automationName.value = value;
  void toggleShowAllPosts(bool value) => showAllPosts.value = value;

  final Rx<ReplyToType> selectedReplyTo = ReplyToType.anyComment.obs;
  final RxString keywords = ''.obs;

  void selectReplyTo(ReplyToType type) => selectedReplyTo.value = type;
  void setKeywords(String value) => keywords.value = value;

  void goToTriggerType() {
    Get.to(() => const TriggerTypeScreen());
  }

  void reset() {
    selectedTrigger.value = TriggerType.commentOnPost;
    selectedPostIndex.value = 0;
    automationName.value = '';
    selectedReplyTo.value = ReplyToType.anyComment;
    keywords.value = '';
  }
}
