import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_responsive.dart';
import '../../../../core/constant/app_text.dart';
import '../controller/brand_controller.dart';

class BrandDashboardScreen extends GetView<BrandDashboardController> {
  const BrandDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: Obx(
              () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            }

            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: AppResponsive.h(110),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppResponsive.h(10),
                  ),

                  _DashboardHeader(
                    joinedText: controller.joinedText,
                  ),

                  SizedBox(
                    height: AppResponsive.h(18),
                  ),

                  const _SearchField(),

                  SizedBox(
                    height: AppResponsive.h(22),
                  ),

                  const _BannerSection(),

                  SizedBox(
                    height: AppResponsive.h(18),
                  ),

                  const _FeatureSection(),

                  SizedBox(
                    height: AppResponsive.h(14),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppResponsive.w(22),
                    ),
                    child: Text(
                      'Brand Insights',
                      style: AppTextStyles.heading.copyWith(
                        fontSize: AppResponsive.sp(18),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: AppResponsive.h(10),
                  ),

                  const _BrandInsights(),

                  SizedBox(
                    height: AppResponsive.h(42),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppResponsive.w(28),
                    ),
                    child: Text(
                      'Discover.\nCollaborate. Grow. 🚀',
                      style: AppTextStyles.heading.copyWith(
                        fontSize: AppResponsive.sp(26),
                        color: AppColors.greyMid,
                        height: 1.25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  final String joinedText;

  const _DashboardHeader({
    required this.joinedText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppResponsive.w(14),
            vertical: AppResponsive.h(7),
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                AppResponsive.r(18),
              ),
              bottomRight: Radius.circular(
                AppResponsive.r(18),
              ),
            ),
          ),
          child: Text(
            joinedText,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.white,
              fontSize: AppResponsive.sp(11),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        const _HeaderIcon(
          icon: Icons.play_circle_outline_rounded,
        ),
        SizedBox(width: AppResponsive.w(10)),
        const _HeaderIcon(
          icon: Icons.notifications_none_rounded,
        ),
        SizedBox(width: AppResponsive.w(10)),
        const _HeaderIcon(
          icon: Icons.wallet_rounded,
        ),
        SizedBox(width: AppResponsive.w(14)),
      ],
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  final IconData icon;

  const _HeaderIcon({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppResponsive.w(29),
      height: AppResponsive.w(29),
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.black,
        ),
      ),
      child: Icon(
        icon,
        size: AppResponsive.sp(17),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppResponsive.w(22),
      ),
      child: Container(
        height: AppResponsive.h(48),
        padding: EdgeInsets.symmetric(
          horizontal: AppResponsive.w(15),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppResponsive.r(10),
          ),
          border: Border.all(
            color: AppColors.primaryLight,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: AppResponsive.sp(22),
              color: AppColors.greyText,
            ),
            SizedBox(width: AppResponsive.w(10)),
            Text(
              'Search',
              style: AppTextStyles.inputHint,
            ),
          ],
        ),
      ),
    );
  }
}

class _BannerSection extends StatelessWidget {
  const _BannerSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppResponsive.w(22),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppResponsive.r(8),
        ),
        child: Image.asset(
          'assets/images/banner.png',
          width: double.infinity,
          height: AppResponsive.h(150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _FeatureSection extends StatelessWidget {
  const _FeatureSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppResponsive.w(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _FeatureItem(
            icon: Icons.smart_toy_rounded,
            title: 'AI',
          ),
          _FeatureItem(
            icon: Icons.campaign_rounded,
            title: 'Create Campaign',
          ),
          _FeatureItem(
            icon: Icons.auto_awesome_rounded,
            title: 'Smart Auto DM',
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _FeatureItem({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppResponsive.w(95),
      child: Column(
        children: [
          Container(
            width: AppResponsive.w(58),
            height: AppResponsive.w(58),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
            ),
            child: Icon(
              icon,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: AppResponsive.h(7)),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.cardTitle.copyWith(
              fontSize: AppResponsive.sp(11),
            ),
          ),
        ],
      ),
    );
  }
}

class _BrandInsights extends StatelessWidget {
  const _BrandInsights();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppResponsive.w(22),
      ),
      child: Container(
        padding: EdgeInsets.all(
          AppResponsive.w(10),
        ),
        decoration: BoxDecoration(
          color: AppColors.greyFieldBg,
          borderRadius: BorderRadius.circular(
            AppResponsive.r(12),
          ),
        ),
        child: SizedBox(
          height: AppResponsive.h(185),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (_, _) => SizedBox(
              width: AppResponsive.w(12),
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppResponsive.r(10),
                ),
                child: Image.asset(
                  'assets/images/insight_${index + 1}.png',
                  width: AppResponsive.w(125),
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}