import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/constants/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.standard, vertical: AppDimens.md),
      children: [
        // Title
        const Text('Profile', style: AppTextStyles.h1),
        const SizedBox(height: 4),
        const Text(
          'Manage your account settings and personal preferences.',
          style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
        ),
        const SizedBox(height: AppDimens.lg),

        // User Avatar Row
        Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                color: Color(0xFFE9D5FF),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'U',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: AppColors.primary),
                ),
              ),
            ),
            const SizedBox(width: AppDimens.md),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('User', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
                SizedBox(height: 2),
                Text('+91 8851571846', style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppDimens.xl),

        // QUICK ACTIONS Header
        const Text(
          'QUICK ACTIONS',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.textMuted, letterSpacing: 0.8),
        ),
        const SizedBox(height: AppDimens.sm),

        // Action Items (Matching media_1788462312803.png)
        _buildActionTile(Icons.person_outline_rounded, 'Profile details', 'Name, contact and KYC info'),
        _buildActionTile(Icons.inventory_2_outlined, 'Purchases', 'Orders, invoices and loan status'),
        _buildActionTile(Icons.savings_outlined, 'Pledge history', 'Funds you pledged or released'),
        _buildActionTile(
          Icons.group_add_outlined,
          'Invite friends',
          'Share the app, earn rewards',
          badgeText: 'EARN ₹500',
        ),
        _buildActionTile(Icons.help_outline_rounded, 'Support & FAQs', 'Find answers or contact us'),
        _buildActionTile(Icons.shield_outlined, 'Privacy policy', 'How we handle your data'),
        _buildActionTile(Icons.description_outlined, 'Terms & conditions', 'Rules governing your use'),
        const SizedBox(height: AppDimens.lg),

        // Log out button
        Center(
          child: OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.cardBorder),
              shape: RoundedRectangleBorder(borderRadius: AppDimens.roundedPill),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: AppColors.surface,
            ),
            icon: const Icon(Icons.logout_rounded, color: AppColors.error, size: 18),
            label: const Text(
              'Log out',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.error),
            ),
          ),
        ),
        const SizedBox(height: AppDimens.md),

        // Made with love by 1Fi
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Made with ', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            Text('💜', style: TextStyle(fontSize: 12)),
            Text(' by 1Fi', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary)),
          ],
        ),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildActionTile(IconData icon, String title, String subtitle, {String? badgeText}) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.sm),
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.md, vertical: AppDimens.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppDimens.roundedLg,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.primarySoft, borderRadius: AppDimens.roundedMd),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: AppDimens.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
              ],
            ),
          ),
          if (badgeText != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE9D5FF),
                borderRadius: AppDimens.roundedPill,
              ),
              child: Text(
                badgeText,
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.primary),
              ),
            ),
            const SizedBox(width: 6),
          ],
          const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted, size: 20),
        ],
      ),
    );
  }
}
