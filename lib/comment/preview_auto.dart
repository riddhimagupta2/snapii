import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/app_colors.dart';
import '../core/constant/app_responsive.dart';
import '../core/constant/app_text.dart';
import '../core/constant/routes/app_routes.dart';
import '../core/widget/gradient_button.dart';

class PreviewAutomationScreen extends StatelessWidget {
  const PreviewAutomationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(22)),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: AppResponsive.sp(14),
                      color: const Color(0xFFA774FF),
                    ),
                  ),
                  SizedBox(width: AppResponsive.w(6)),
                  Text(
                    'Preview Automation',
                    style: AppTextStyles.fieldLabel.copyWith(
                      fontSize: AppResponsive.sp(15),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFA774FF),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppResponsive.h(22)),

              Expanded(
                child: PageView(
                  children: const [
                    _PostPreviewPhone(),
                    _DmPreviewPhone(),
                    _CommentPreviewPhone(),
                  ],
                ),
              ),

              SizedBox(height: AppResponsive.h(10)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Swipe to watch preview',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppResponsive.sp(13),
                      color: const Color(0xFF777777),
                    ),
                  ),
                  SizedBox(width: AppResponsive.w(8)),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: AppResponsive.sp(17),
                    color: AppColors.black,
                  ),
                ],
              ),

              SizedBox(height: AppResponsive.h(18)),

              SizedBox(
                width: double.infinity,
                height: AppResponsive.h(46),
                child: GradientButton(
                  label: 'Back',
                  isOutlined: true,
                  onTap: () => Get.back(),
                ),
              ),

              SizedBox(height: AppResponsive.h(10)),

              SizedBox(
                width: double.infinity,
                height: AppResponsive.h(46),
                child: GradientButton(
                  label: 'Go Live',
                  onTap: () => Get.toNamed(AppRoutes.autoScreen),
                ),
              ),

              SizedBox(height: AppResponsive.h(18)),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneFrame extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const _PhoneFrame({required this.child, this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppResponsive.w(315),
        padding: EdgeInsets.all(AppResponsive.w(6)),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(AppResponsive.r(26)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppResponsive.r(22)),
          child: Container(color: backgroundColor, child: child),
        ),
      ),
    );
  }
}

class _MiniStatusBar extends StatelessWidget {
  final Color color;

  const _MiniStatusBar({this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppResponsive.w(12),
        AppResponsive.h(8),
        AppResponsive.w(12),
        AppResponsive.h(6),
      ),
      child: Row(
        children: [
          Text(
            '10:20',
            style: AppTextStyles.caption.copyWith(
              fontSize: AppResponsive.sp(10),
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.signal_cellular_alt,
            size: AppResponsive.sp(11),
            color: color,
          ),
          SizedBox(width: AppResponsive.w(3)),
          Icon(Icons.wifi, size: AppResponsive.sp(11), color: color),
          SizedBox(width: AppResponsive.w(3)),
          Icon(Icons.battery_full, size: AppResponsive.sp(13), color: color),
        ],
      ),
    );
  }
}

class _DmPreviewPhone extends StatelessWidget {
  const _DmPreviewPhone();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _MiniStatusBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(10)),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: AppResponsive.sp(12),
                ),
                SizedBox(width: AppResponsive.w(6)),
                CircleAvatar(
                  radius: AppResponsive.w(12),
                  backgroundColor: const Color(0xFFECECEC),
                  child: Icon(
                    Icons.person,
                    size: AppResponsive.sp(14),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: AppResponsive.w(6)),
                Text(
                  'Richa',
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: AppResponsive.sp(12),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Icon(Icons.call_outlined, size: AppResponsive.sp(15)),
                SizedBox(width: AppResponsive.w(10)),
                Icon(Icons.videocam_outlined, size: AppResponsive.sp(16)),
              ],
            ),
          ),

          SizedBox(height: AppResponsive.h(10)),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(10)),
              child: Column(
                children: const [
                  _IncomingBubble(
                    text:
                        'Hey there 👋\nThanks a lot for reaching out — really excited to see your interest 😊\nYou’re just one step away from getting everything you need. Tap below and I’ll send the details right over 🚀',
                    buttons: ['Send me the link'],
                  ),
                  _OutgoingBubble(text: 'Send me the Link'),
                  _IncomingBubble(
                    text:
                        'Before I send the details 😊\n\nPlease follow the profile first, then tap\n"I’m Following" below to continue ✨',
                    buttons: ['Visit Profile', 'I’m Following ✅'],
                  ),
                  _OutgoingBubble(text: 'I’m Following ✅'),
                  _IncomingBubble(
                    text:
                        'It looks like the profile hasn’t been followed yet 😊\nFollow the account first to unlock your access 🚀',
                    buttons: ['Visit Profile', 'I’m Following ✅'],
                  ),
                  _OutgoingBubble(text: 'I’m Following ✅'),
                  _IncomingBubble(
                    text: 'Hey\nThanks for testing. Here the link is',
                    buttons: ['Click here'],
                  ),
                ],
              ),
            ),
          ),

          const _MiniMessageInput(),

          SizedBox(height: AppResponsive.h(8)),
        ],
      ),
    );
  }
}

class _IncomingBubble extends StatelessWidget {
  final String text;
  final List<String> buttons;

  const _IncomingBubble({required this.text, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: AppResponsive.w(18),
          height: AppResponsive.w(18),
          decoration: const BoxDecoration(
            color: Color(0xFFA774FF),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: AppResponsive.w(8)),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: AppResponsive.h(8)),
            padding: EdgeInsets.all(AppResponsive.w(9)),
            decoration: BoxDecoration(
              color: const Color(0xFFE6E6E6),
              borderRadius: BorderRadius.circular(AppResponsive.r(8)),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    text,
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppResponsive.sp(8),
                      height: 1.15,
                      color: AppColors.black,
                    ),
                  ),
                ),
                SizedBox(height: AppResponsive.h(6)),
                ...buttons.map(
                  (b) => Container(
                    width: double.infinity,
                    height: AppResponsive.h(20),
                    margin: EdgeInsets.only(bottom: AppResponsive.h(4)),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppResponsive.r(20)),
                      border: Border.all(color: const Color(0xFFBDBDBD)),
                    ),
                    child: Text(
                      b,
                      style: AppTextStyles.caption.copyWith(
                        fontSize: AppResponsive.sp(8),
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _OutgoingBubble extends StatelessWidget {
  final String text;

  const _OutgoingBubble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(bottom: AppResponsive.h(8)),
        padding: EdgeInsets.symmetric(
          horizontal: AppResponsive.w(12),
          vertical: AppResponsive.h(6),
        ),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(AppResponsive.r(12)),
        ),
        child: Text(
          text,
          style: AppTextStyles.caption.copyWith(
            fontSize: AppResponsive.sp(8),
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _MiniMessageInput extends StatelessWidget {
  const _MiniMessageInput();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.h(35),
      margin: EdgeInsets.symmetric(horizontal: AppResponsive.w(10)),
      padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(8)),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDADADA)),
        borderRadius: BorderRadius.circular(AppResponsive.r(20)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppResponsive.w(11),
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.camera_alt,
              size: AppResponsive.sp(11),
              color: AppColors.white,
            ),
          ),
          SizedBox(width: AppResponsive.w(8)),
          Text(
            'Message...',
            style: AppTextStyles.caption.copyWith(
              fontSize: AppResponsive.sp(10),
              color: Colors.grey,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.image_outlined,
            size: AppResponsive.sp(13),
            color: Colors.grey,
          ),
          SizedBox(width: AppResponsive.w(8)),
          Icon(
            Icons.chat_bubble_outline,
            size: AppResponsive.sp(13),
            color: Colors.grey,
          ),
          SizedBox(width: AppResponsive.w(8)),
          Icon(
            Icons.add_circle_outline,
            size: AppResponsive.sp(14),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class _PostPreviewPhone extends StatelessWidget {
  const _PostPreviewPhone();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          const _MiniStatusBar(color: Colors.white),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(12)),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: AppResponsive.sp(12),
                ),
                const Spacer(),
                Text(
                  'Post',
                  style: AppTextStyles.cardTitle.copyWith(
                    color: Colors.white,
                    fontSize: AppResponsive.sp(14),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                SizedBox(width: AppResponsive.w(12)),
              ],
            ),
          ),

          Divider(color: Colors.white.withOpacity(.3)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(14)),
            child: Row(
              children: [
                CircleAvatar(radius: AppResponsive.w(12)),
                SizedBox(width: AppResponsive.w(8)),
                Text(
                  'Richa',
                  style: AppTextStyles.cardTitle.copyWith(
                    color: Colors.white,
                    fontSize: AppResponsive.sp(12),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: AppResponsive.sp(18),
                ),
              ],
            ),
          ),

          SizedBox(height: AppResponsive.h(14)),

          Container(
            height: AppResponsive.h(260),
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: AppResponsive.w(14)),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              image: const DecorationImage(
                image: AssetImage('assets/images/post_2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: AppResponsive.h(16)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(18)),
            child: Row(
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: AppResponsive.sp(24),
                ),
                SizedBox(width: AppResponsive.w(18)),
                Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white,
                  size: AppResponsive.sp(23),
                ),
                SizedBox(width: AppResponsive.w(18)),
                Icon(
                  Icons.send_outlined,
                  color: Colors.white,
                  size: AppResponsive.sp(23),
                ),
                const Spacer(),
                Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: AppResponsive.sp(24),
                ),
              ],
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}

class _CommentPreviewPhone extends StatelessWidget {
  const _CommentPreviewPhone();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          const _MiniStatusBar(color: Colors.white),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(12)),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: AppResponsive.sp(12),
                ),
                const Spacer(),
              ],
            ),
          ),

          SizedBox(height: AppResponsive.h(12)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(14)),
            child: Row(
              children: [
                CircleAvatar(radius: AppResponsive.w(12)),
                SizedBox(width: AppResponsive.w(8)),
                Text(
                  'Richa',
                  style: AppTextStyles.cardTitle.copyWith(
                    color: Colors.white,
                    fontSize: AppResponsive.sp(12),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: AppResponsive.sp(18),
                ),
              ],
            ),
          ),

          SizedBox(height: AppResponsive.h(14)),

          Container(
            height: AppResponsive.h(220),
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: AppResponsive.w(14)),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              image: const DecorationImage(
                image: AssetImage('assets/images/post_2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppResponsive.w(16)),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppResponsive.r(24)),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: AppResponsive.w(45),
                    height: AppResponsive.h(3),
                    color: Colors.grey,
                  ),

                  SizedBox(height: AppResponsive.h(8)),

                  Text(
                    'Comments',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppResponsive.sp(12),
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: AppResponsive.h(16)),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: AppResponsive.w(14),
                        backgroundColor: const Color(0xFFA774FF),
                      ),
                      SizedBox(width: AppResponsive.w(8)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Snaapii   2m',
                            style: AppTextStyles.caption.copyWith(
                              fontSize: AppResponsive.sp(12),
                              color: AppColors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Woww',
                            style: AppTextStyles.caption.copyWith(
                              fontSize: AppResponsive.sp(11),
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.favorite_border,
                        size: AppResponsive.sp(15),
                        color: Colors.grey,
                      ),
                    ],
                  ),

                  SizedBox(height: AppResponsive.h(20)),

                  Row(
                    children: [
                      SizedBox(width: AppResponsive.w(80)),
                      CircleAvatar(radius: AppResponsive.w(13)),
                      SizedBox(width: AppResponsive.w(8)),
                      Text(
                        '2m\nThanks! Check DM 🙌',
                        style: AppTextStyles.caption.copyWith(
                          fontSize: AppResponsive.sp(11),
                          color: AppColors.black,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.favorite_border,
                        size: AppResponsive.sp(15),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
