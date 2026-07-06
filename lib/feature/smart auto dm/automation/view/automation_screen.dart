import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_responsive.dart';
import '../../../../core/constant/app_text.dart';
import '../../../../core/constant/routes/app_routes.dart';
import '../../../../core/widget/gradient_button.dart';



class AutomationListScreen extends StatelessWidget {
  const AutomationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  AppResponsive.w(20),
                  0,
                  AppResponsive.w(20),
                  AppResponsive.h(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle('Comment on post or reel'),

                    SizedBox(height: AppResponsive.h(8)),

                    _AutomationCard(
                      title: 'Shoe Collection',
                      subtitle: '',
                      tag: 'Any Comments',
                      imagePath: 'assets/images/post_2.png',
                      isLive: true,
                      stats: const [
                        _StatData(
                          value: '215',
                          label: 'Followers',
                          icon: Icons.people_alt_rounded,
                        ),
                        _StatData(
                          value: '1200',
                          label: 'Comments',
                          icon: Icons.chat_bubble_rounded,
                        ),
                        _StatData(
                          value: '392',
                          label: 'Clicks',
                          icon: Icons.ads_click_rounded,
                        ),
                      ],
                      onTap: () {
                        Get.toNamed(AppRoutes.automationDetail);
                      },
                    ),

                    SizedBox(height: AppResponsive.h(18)),
                  ],
                ),
              ),
            ),

            _buildCreateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppResponsive.w(20),
        AppResponsive.h(14),
        AppResponsive.w(20),
        AppResponsive.h(10),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(
              AppResponsive.r(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                AppResponsive.w(4),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: AppResponsive.sp(14),
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(width: AppResponsive.w(6)),
          Text(
            'Smart Auto DM',
            style: AppTextStyles.appBarTitle.copyWith(
              fontSize: AppResponsive.sp(16),
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.fieldLabel.copyWith(
        fontSize: AppResponsive.sp(12),
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    );
  }

  Widget _buildCreateButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        AppResponsive.w(38),
        AppResponsive.h(8),
        AppResponsive.w(38),
        AppResponsive.h(12),
      ),
      color: AppColors.white,
      child: SizedBox(
        width: double.infinity,
        height: AppResponsive.h(46),
        child: GradientButton(
          label: 'Create Automation',
          onTap: () {
            Get.toNamed(AppRoutes.triggerType);
          },
        ),
      ),
    );
  }
}

class _AutomationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String tag;

  final String? imagePath;
  final IconData? leadingIcon;

  final bool isLive;
  final bool showExtraStats;

  final List<_StatData> stats;

  final VoidCallback onTap;

  const _AutomationCard({
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.stats,
    required this.onTap,
    this.imagePath,
    this.leadingIcon,
    this.isLive = false,
    this.showExtraStats = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          AppResponsive.r(10),
        ),
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              AppResponsive.r(10),
            ),
            border: Border.all(
              color: AppColors.primary,
              width: AppResponsive.w(1),
            ),
          ),
          child: Column(
            children: [
              _buildCardHeader(),

              if (showExtraStats)
                const _ExtraStatsRow(),

              _buildStats(),

              _buildViewDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardHeader() {
    return Padding(
      padding: EdgeInsets.all(
        AppResponsive.w(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLeading(),

          SizedBox(width: AppResponsive.w(10)),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: AppResponsive.sp(11),
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),

                if (subtitle.isNotEmpty) ...[
                  SizedBox(height: AppResponsive.h(2)),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppResponsive.sp(8),
                      color: const Color(0xFF888888),
                    ),
                  ),
                ],

                SizedBox(height: AppResponsive.h(6)),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppResponsive.w(8),
                    vertical: AppResponsive.h(3),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1E8FF),
                    borderRadius: BorderRadius.circular(
                      AppResponsive.r(10),
                    ),
                  ),
                  child: Text(
                    tag,
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppResponsive.sp(7),
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (isLive)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppResponsive.w(12),
                vertical: AppResponsive.h(5),
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFD9F8E9),
                borderRadius: BorderRadius.circular(
                  AppResponsive.r(15),
                ),
              ),
              child: Text(
                'Live',
                style: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(8),
                  color: const Color(0xFF20B978),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLeading() {
    if (imagePath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(
          AppResponsive.r(7),
        ),
        child: Image.asset(
          imagePath!,
          width: AppResponsive.w(56),
          height: AppResponsive.w(56),
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      width: AppResponsive.w(48),
      height: AppResponsive.w(48),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFE8D7FF),
        borderRadius: BorderRadius.circular(
          AppResponsive.r(4),
        ),
      ),
      child: Icon(
        leadingIcon ?? Icons.send_rounded,
        color: AppColors.primary,
        size: AppResponsive.sp(24),
      ),
    );
  }

  Widget _buildStats() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppResponsive.w(10),
        vertical: AppResponsive.h(10),
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFFAF7FF),
      ),
      child: Row(
        children: List.generate(
          stats.length,
              (index) {
            return Expanded(
              child: _StatItem(
                data: stats[index],
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildViewDetails() {
    return Padding(
      padding: EdgeInsets.all(
        AppResponsive.w(9),
      ),
      child: Container(
        width: double.infinity,
        height: AppResponsive.h(36),
        padding: EdgeInsets.symmetric(
          horizontal: AppResponsive.w(14),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary,
            width: AppResponsive.w(0.8),
          ),
          borderRadius: BorderRadius.circular(
            AppResponsive.r(8),
          ),
        ),
        child: Row(
          children: [
            const Spacer(),

            Text(
              'View details',
              style: AppTextStyles.caption.copyWith(
                fontSize: AppResponsive.sp(9),
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),

            const Spacer(),

            Icon(
              Icons.arrow_forward_ios_rounded,
              size: AppResponsive.sp(10),
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatData {
  final String value;
  final String label;
  final IconData icon;

  const _StatData({
    required this.value,
    required this.label,
    required this.icon,
  });
}

class _StatItem extends StatelessWidget {
  final _StatData data;
  final int index;

  const _StatItem({
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final List<Color> backgroundColors = [
      const Color(0xFFDDF9EC),
      const Color(0xFFE9DEFF),
      const Color(0xFFFFDDF0),
    ];

    final List<Color> iconColors = [
      const Color(0xFF10B981),
      const Color(0xFF9B6BFF),
      const Color(0xFFFF5BA8),
    ];

    final int colorIndex = index % backgroundColors.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: AppResponsive.w(24),
          height: AppResponsive.w(24),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColors[colorIndex],
            borderRadius: BorderRadius.circular(
              AppResponsive.r(4),
            ),
          ),
          child: Icon(
            data.icon,
            size: AppResponsive.sp(12),
            color: iconColors[colorIndex],
          ),
        ),

        SizedBox(width: AppResponsive.w(6)),

        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.value,
                maxLines: 1,
                style: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(10),
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              Text(
                data.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(6.5),
                  color: const Color(0xFF777777),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExtraStatsRow extends StatelessWidget {
  const _ExtraStatsRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppResponsive.w(10),
        vertical: AppResponsive.h(8),
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFFAF7FF),
      ),
      child: Row(
        children: const [
          Expanded(
            child: _ExtraStat(
              icon: Icons.history_rounded,
              title: 'Replies Delays',
              value: '15 sec',
            ),
          ),
          Expanded(
            child: _ExtraStat(
              icon: Icons.favorite_rounded,
              title: 'Auto Like',
              value: 'ON',
            ),
          ),
        ],
      ),
    );
  }
}

class _ExtraStat extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _ExtraStat({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppResponsive.w(28),
          height: AppResponsive.w(28),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFEADFFF),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: AppResponsive.sp(13),
            color: AppColors.primary,
          ),
        ),

        SizedBox(width: AppResponsive.w(6)),

        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(7),
                  color: const Color(0xFF777777),
                ),
              ),
              Text(
                value,
                style: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(9),
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}