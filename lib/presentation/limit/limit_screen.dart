import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/constants/app_text_styles.dart';

class LimitScreen extends StatelessWidget {
  const LimitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.standard, vertical: AppDimens.md),
      children: [
        // 1. Remaining Limit Hero Card (Matching media_1788462299886.png)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimens.lg),
          decoration: BoxDecoration(
            gradient: AppColors.heroGradient,
            borderRadius: AppDimens.roundedXl,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withAlpha(50),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'REMAINING LIMIT',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white70, letterSpacing: 0.8),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '₹1,56,091',
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.white),
                      ),
                      Text(
                        'Available to spend',
                        style: TextStyle(fontSize: 11, color: Colors.white70),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: AppDimens.roundedPill),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text('Increase Limit', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800)),
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.lg),

              // Utilization bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('UTILIZED', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.white70, letterSpacing: 0.5)),
                  Text('46%', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: const LinearProgressIndicator(
                  value: 0.46,
                  minHeight: 6,
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.md),

        // 2. Metrics Grid: Sanctioned Limit & Pledged Value
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(AppDimens.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppDimens.roundedLg,
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('SANCTIONED LIMIT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.textMuted)),
                    SizedBox(height: 4),
                    Text('₹2,91,091', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                    Divider(height: 16),
                    Text('OUTSTANDING', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.textMuted)),
                    SizedBox(height: 4),
                    Text('₹1,35,000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: AppDimens.md),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(AppDimens.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppDimens.roundedLg,
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('PLEDGED VALUE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.textMuted)),
                    const SizedBox(height: 4),
                    const Text('₹3,88,122', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                    const Text('Across 2 funds', style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                    const SizedBox(height: 12),
                    // Mini Growth Curve Graphic
                    Container(
                      height: 38,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primarySoft, AppColors.surface],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Icon(Icons.show_chart_rounded, color: AppColors.primary, size: 28),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.lg),

        // 3. Quick Actions
        Container(
          padding: const EdgeInsets.all(AppDimens.md),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: AppDimens.roundedLg,
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('QUICK ACTIONS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.textMuted, letterSpacing: 0.5)),
              const SizedBox(height: AppDimens.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickAction(Icons.add, 'Pledge More'),
                  _buildQuickAction(Icons.edit_outlined, 'Remove Pledge'),
                  _buildQuickAction(Icons.history_rounded, 'Pledge History'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.lg),

        // 4. Pledged Mutual Funds List
        const Text('Pledged Mutual Funds', style: AppTextStyles.h2),
        const Text('2 funds across your portfolio', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
        const SizedBox(height: AppDimens.sm),

        _buildMutualFundCard('Bandhan Small Cap Fund - Regular Growth', '₹28', '₹21'),
        _buildMutualFundCard('quant Small Cap Fund - Growth Option Direct Plan', '₹1,35,000', '₹1,01,250'),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(color: AppColors.primarySoft, shape: BoxShape.circle),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
      ],
    );
  }

  Widget _buildMutualFundCard(String fundName, String value, String limit) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.sm),
      padding: const EdgeInsets.all(AppDimens.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppDimens.roundedLg,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: AppColors.primarySoft, borderRadius: AppDimens.roundedMd),
            child: const Icon(Icons.account_balance_rounded, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: AppDimens.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fundName, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text('Value: $value  •  Limit: $limit', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textMuted),
        ],
      ),
    );
  }
}
