import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_responsive.dart';
import '../../../../core/constant/app_text.dart';
import '../../../../core/constant/routes/app_routes.dart';
import '../../../../core/widget/gradient_button.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppResponsive.w(22),
               0,
                AppResponsive.w(22),
                0,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: Get.back,
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: AppResponsive.sp(14),
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: AppResponsive.w(8)),
                  Text(
                    'Preview',
                    style: AppTextStyles.heading.copyWith(
                      fontSize: AppResponsive.sp(18),
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: const [
                  _CommentPreviewPhone(
                    firstLiked: false,
                    secondLiked: false,
                  ),
                  _CommentPreviewPhone(
                    firstLiked: true,
                    secondLiked: true,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppResponsive.h(8)),

            _PageIndicator(
              currentPage: currentPage,
              pageCount: 2,
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(
                AppResponsive.w(44),
                AppResponsive.h(16),
                AppResponsive.w(44),
                AppResponsive.h(26),
              ),
              child: SizedBox(
                width: double.infinity,
                height: AppResponsive.h(48),
                child: GradientButton(
                  label: 'Go Live',
                  onTap: () => Get.toNamed(AppRoutes.autoScreen),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const _PageIndicator({
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
            (index) {
          final bool selected = currentPage == index;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: EdgeInsets.symmetric(
              horizontal: AppResponsive.w(4),
            ),
            width: selected
                ? AppResponsive.w(18)
                : AppResponsive.w(7),
            height: AppResponsive.h(7),
            decoration: BoxDecoration(
              color: selected
                  ? AppColors.primary
                  : const Color(0xFFD8C5FF),
              borderRadius: BorderRadius.circular(
                AppResponsive.r(20),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CommentPreviewPhone extends StatelessWidget {
  final bool firstLiked;
  final bool secondLiked;

  const _CommentPreviewPhone({
    required this.firstLiked,
    required this.secondLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppResponsive.w(28),
      ),
      child: Center(
        child: AspectRatio(
          aspectRatio: 0.60,
          child: Container(
            padding: EdgeInsets.all(
              AppResponsive.w(5),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                AppResponsive.r(22),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                AppResponsive.r(18),
              ),
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    const _PhoneStatusBar(),

                    SizedBox(height: AppResponsive.h(6)),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppResponsive.w(12),
                        vertical: AppResponsive.h(5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: AppResponsive.sp(12),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppResponsive.w(14),
                        vertical: AppResponsive.h(6),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: AppResponsive.w(11),
                            backgroundImage: const AssetImage(
                              'assets/images/post_1.png',
                            ),
                          ),

                          SizedBox(width: AppResponsive.w(8)),

                          Text(
                            'Richa',
                            style: AppTextStyles.caption.copyWith(
                              fontSize: AppResponsive.sp(11),
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
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

                    SizedBox(height: AppResponsive.h(5)),

                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/post_2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 6,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: AppResponsive.w(14),
                          vertical: AppResponsive.h(8),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                              AppResponsive.r(22),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: AppResponsive.w(38),
                              height: AppResponsive.h(3),
                              decoration: BoxDecoration(
                                color: const Color(0xFF9D9D9D),
                                borderRadius: BorderRadius.circular(
                                  AppResponsive.r(20),
                                ),
                              ),
                            ),

                            SizedBox(height: AppResponsive.h(6)),

                            Text(
                              'Comments',
                              style: AppTextStyles.caption.copyWith(
                                fontSize: AppResponsive.sp(11),
                                color: const Color(0xFF999999),
                              ),
                            ),

                            SizedBox(height: AppResponsive.h(14)),

                            _CommentRow(
                              username: 'Snaapii',
                              comment: 'Woww',
                              reply: 'Appreciate it',
                              liked: firstLiked,
                            ),

                            SizedBox(height: AppResponsive.h(18)),

                            _CommentRow(
                              username: 'Snaapii',
                              comment: 'Great',
                              reply: 'Thank You',
                              liked: secondLiked,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PhoneStatusBar extends StatelessWidget {
  const _PhoneStatusBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppResponsive.w(12),
        AppResponsive.h(8),
        AppResponsive.w(12),
        AppResponsive.h(2),
      ),
      child: Row(
        children: [
          Text(
            '10:20',
            style: AppTextStyles.caption.copyWith(
              fontSize: AppResponsive.sp(9),
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),

          const Spacer(),

          Icon(
            Icons.signal_cellular_alt,
            color: Colors.white,
            size: AppResponsive.sp(11),
          ),

          SizedBox(width: AppResponsive.w(3)),

          Icon(
            Icons.wifi,
            color: Colors.white,
            size: AppResponsive.sp(11),
          ),

          SizedBox(width: AppResponsive.w(3)),

          Icon(
            Icons.battery_full,
            color: Colors.white,
            size: AppResponsive.sp(13),
          ),
        ],
      ),
    );
  }
}

class _CommentRow extends StatelessWidget {
  final String username;
  final String comment;
  final String reply;
  final bool liked;

  const _CommentRow({
    required this.username,
    required this.comment,
    required this.reply,
    required this.liked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: AppResponsive.w(14),
              backgroundColor: AppColors.primary,
            ),

            SizedBox(width: AppResponsive.w(8)),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        username,
                        style: AppTextStyles.caption.copyWith(
                          fontSize: AppResponsive.sp(10),
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(width: AppResponsive.w(8)),

                      Text(
                        '2m',
                        style: AppTextStyles.caption.copyWith(
                          fontSize: AppResponsive.sp(9),
                          color: const Color(0xFF999999),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: AppResponsive.h(2)),

                  Text(
                    comment,
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppResponsive.sp(10),
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              liked
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: AppResponsive.sp(15),
              color: liked
                  ? const Color(0xFFFF4B4B)
                  : const Color(0xFFBDBDBD),
            ),
          ],
        ),

        SizedBox(height: AppResponsive.h(10)),

        Padding(
          padding: EdgeInsets.only(
            left: AppResponsive.w(72),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: AppResponsive.w(12),
                backgroundImage: const AssetImage(
                  'assets/images/post_1.png',
                ),
              ),

              SizedBox(width: AppResponsive.w(8)),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2m',
                      style: AppTextStyles.caption.copyWith(
                        fontSize: AppResponsive.sp(9),
                        color: const Color(0xFF999999),
                      ),
                    ),

                    SizedBox(height: AppResponsive.h(2)),

                    Text(
                      reply,
                      style: AppTextStyles.caption.copyWith(
                        fontSize: AppResponsive.sp(10),
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.favorite_border,
                size: AppResponsive.sp(14),
                color: const Color(0xFFBDBDBD),
              ),
            ],
          ),
        ),
      ],
    );
  }
}