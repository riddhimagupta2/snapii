import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/app_responsive.dart';
import '../../core/constant/app_text.dart';

class AutomationDetailScreen extends StatelessWidget {
  const AutomationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF111111) : AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppResponsive.w(18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppResponsive.h(12)),

              _Header(isDark: isDark),

              SizedBox(height: AppResponsive.h(18)),

              const _ActiveBanner(),

              SizedBox(height: AppResponsive.h(12)),

              const _AutomationCard(),

              SizedBox(height: AppResponsive.h(14)),

              _OverviewHeader(isDark: isDark),

              SizedBox(height: AppResponsive.h(10)),

              const _StatsGrid(),

              SizedBox(height: AppResponsive.h(10)),

              const _ClicksCard(),

              const Spacer(),

              _ActionButtons(isDark: isDark),

              SizedBox(height: AppResponsive.h(16)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final bool isDark;

  const _Header({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: Get.back,
          borderRadius: BorderRadius.circular(20),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: AppResponsive.sp(13),
            color: AppColors.primary,
          ),
        ),
        SizedBox(width: AppResponsive.w(8)),
        Text(
          'Shoe Collection',
          style: AppTextStyles.fieldLabel.copyWith(
            fontSize: AppResponsive.sp(13),
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}

class _ActiveBanner extends StatelessWidget {
  const _ActiveBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppResponsive.w(12)),
      decoration: BoxDecoration(
        color: const Color(0xFFDFF8E8),
        borderRadius: BorderRadius.circular(AppResponsive.r(8)),
        border: Border.all(color: const Color(0xFF8BE3A8)),
      ),
      child: Row(
        children: [
          Container(
            width: AppResponsive.w(28),
            height: AppResponsive.w(28),
            decoration: const BoxDecoration(
              color: Color(0xFF16A34A),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              size: AppResponsive.sp(18),
              color: Colors.white,
            ),
          ),
          SizedBox(width: AppResponsive.w(10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Automation Active',
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: AppResponsive.sp(12),
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF166534),
                  ),
                ),
                SizedBox(height: AppResponsive.h(2)),
                Text(
                  'Your automation is live and responding to user automatically',
                  style: AppTextStyles.caption.copyWith(
                    fontSize: AppResponsive.sp(8.5),
                    color: const Color(0xFF166534),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AutomationCard extends StatelessWidget {
  const _AutomationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppResponsive.w(10)),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppResponsive.r(10)),
        border: Border.all(color: const Color(0xFFD8B4FF)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppResponsive.r(8)),
            child: Image.asset(
              'assets/images/post_2.png',
              width: AppResponsive.w(62),
              height: AppResponsive.w(62),
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: AppResponsive.w(62),
                height: AppResponsive.w(62),
                color: const Color(0xFFEDEDED),
                child: const Icon(Icons.image),
              ),
            ),
          ),
          SizedBox(width: AppResponsive.w(10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shoe Collection',
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: AppResponsive.sp(12),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: AppResponsive.h(5)),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppResponsive.w(10),
                    vertical: AppResponsive.h(4),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1E8FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Any Comments',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: AppResponsive.sp(8),
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppResponsive.w(14),
              vertical: AppResponsive.h(5),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFD9F8E9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Live',
              style: AppTextStyles.caption.copyWith(
                fontSize: AppResponsive.sp(8.5),
                color: const Color(0xFF16A34A),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OverviewHeader extends StatelessWidget {
  final bool isDark;

  const _OverviewHeader({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Performance Overview',
          style: AppTextStyles.cardTitle.copyWith(
            fontSize: AppResponsive.sp(12),
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white : AppColors.black,
          ),
        ),
        const Spacer(),
        Text(
          'Today',
          style: AppTextStyles.caption.copyWith(
            fontSize: AppResponsive.sp(9),
            color: const Color(0xFF777777),
          ),
        ),
      ],
    );
  }
}

class _StatsGrid extends StatelessWidget {
  const _StatsGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: _StatCard(
                icon: Icons.chat_bubble_rounded,
                value: '1200',
                label: 'Comments Triggered',
                bg: Color(0xFFE9DCFF),
                iconColor: Color(0xFF8B5CF6),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _StatCard(
                icon: Icons.send_rounded,
                value: '1200',
                label: 'DMs Sent',
                bg: Color(0xFFE9DCFF),
                iconColor: Color(0xFF8B5CF6),
              ),
            ),
          ],
        ),
        SizedBox(height: AppResponsive.h(10)),
        Row(
          children: const [
            Expanded(
              child: _StatCard(
                icon: Icons.remove_red_eye_rounded,
                value: '120',
                label: 'Profile Visits',
                bg: Color(0xFFFFD6EA),
                iconColor: Color(0xFFFF4FA3),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _StatCard(
                icon: Icons.people_alt_rounded,
                value: '120',
                label: 'Followers Gained',
                bg: Color(0xFFD9F8E9),
                iconColor: Color(0xFF16A34A),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color bg;
  final Color iconColor;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.bg,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.h(75),
      padding: EdgeInsets.all(AppResponsive.w(10)),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppResponsive.r(8)),
      ),
      child: Row(
        children: [
          Container(
            width: AppResponsive.w(28),
            height: AppResponsive.w(28),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.7),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, size: AppResponsive.sp(15), color: iconColor),
          ),
          SizedBox(width: AppResponsive.w(9)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: AppResponsive.sp(13),
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: AppResponsive.h(2)),
                Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption.copyWith(
                    fontSize: AppResponsive.sp(8),
                    color: const Color(0xFF444444),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ClicksCard extends StatelessWidget {
  const _ClicksCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.h(58),
      padding: EdgeInsets.all(AppResponsive.w(11)),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD6EA),
        borderRadius: BorderRadius.circular(AppResponsive.r(8)),
      ),
      child: Row(
        children: [
          Container(
            width: AppResponsive.w(30),
            height: AppResponsive.w(30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.7),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              Icons.ads_click_rounded,
              size: AppResponsive.sp(16),
              color: const Color(0xFFFF4FA3),
            ),
          ),
          SizedBox(width: AppResponsive.w(10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Link Clicks',
                style: AppTextStyles.caption.copyWith(
                  fontSize: AppResponsive.sp(9),
                  color: const Color(0xFF444444),
                ),
              ),
              Text(
                '392',
                style: AppTextStyles.cardTitle.copyWith(
                  fontSize: AppResponsive.sp(14),
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final bool isDark;

  const _ActionButtons({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _SmallActionButton(
          label: 'Edit',
          onTap: () {},
        ),
        SizedBox(width: AppResponsive.w(8)),
        _SmallActionButton(
          label: 'Paused',
          onTap: () => _showPauseDialog(context),
        ),
        SizedBox(width: AppResponsive.w(8)),
        _SmallActionButton(
          label: 'Preview',
          onTap: () {},
        ),
        SizedBox(width: AppResponsive.w(8)),
        _SmallActionButton(
          label: 'Delete',
          onTap: () => _showDeleteDialog(context),
        ),
      ],
    );
  }
}

class _SmallActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SmallActionButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppResponsive.r(6)),
        child: Container(
          height: AppResponsive.h(35),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF2E8FF),
            borderRadius: BorderRadius.circular(AppResponsive.r(6)),
          ),
          child: Text(
            label,
            style: AppTextStyles.caption.copyWith(
              fontSize: AppResponsive.sp(9.5),
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}

void _showPauseDialog(BuildContext context) {
  _showConfirmDialog(
    context: context,
    title: 'Are you sure you want to Pause',
    confirmText: 'Pause',
    confirmColor: const Color(0xFFEF4444),
    onConfirm: () => Get.back(),
  );
}

void _showDeleteDialog(BuildContext context) {
  _showConfirmDialog(
    context: context,
    title: 'Are you sure you want to Delete',
    confirmText: 'Delete',
    confirmColor: const Color(0xFFEF4444),
    onConfirm: () => Get.back(),
  );
}

void _showConfirmDialog({
  required BuildContext context,
  required String title,
  required String confirmText,
  required Color confirmColor,
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(.55),
    builder: (_) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: AppResponsive.w(250),
            padding: EdgeInsets.all(AppResponsive.w(14)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppResponsive.r(8)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: AppResponsive.sp(11),
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: AppResponsive.h(16)),
                Row(
                  children: [
                    Expanded(
                      child: _DialogButton(
                        label: 'Cancel',
                        bg: Colors.white,
                        border: const Color(0xFFCFCFCF),
                        textColor: AppColors.black,
                        onTap: () => Get.back(),
                      ),
                    ),
                    SizedBox(width: AppResponsive.w(10)),
                    Expanded(
                      child: _DialogButton(
                        label: confirmText,
                        bg: confirmColor,
                        border: confirmColor,
                        textColor: Colors.white,
                        onTap: onConfirm,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class _DialogButton extends StatelessWidget {
  final String label;
  final Color bg;
  final Color border;
  final Color textColor;
  final VoidCallback onTap;

  const _DialogButton({
    required this.label,
    required this.bg,
    required this.border,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppResponsive.r(5)),
      child: Container(
        height: AppResponsive.h(32),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(AppResponsive.r(5)),
          border: Border.all(color: border),
        ),
        child: Text(
          label,
          style: AppTextStyles.caption.copyWith(
            fontSize: AppResponsive.sp(9),
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}