import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/constants/app_text_styles.dart';

class EmiDuesScreen extends StatefulWidget {
  const EmiDuesScreen({super.key});

  @override
  State<EmiDuesScreen> createState() => _EmiDuesScreenState();
}

class _EmiDuesScreenState extends State<EmiDuesScreen> {
  int _selectedTab = 0; // 0: EMIs to be paid, 1: Completed EMIs

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.standard, vertical: AppDimens.md),
      children: [
        // 1. Top Purple Card: Outstanding & Upcoming EMI (Matching media_1788462294524.png)
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
            children: [
              // Top metrics row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'TOTAL OUTSTANDING',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white70, letterSpacing: 0.8),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '₹1,220',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'ACTIVE LOANS',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white70, letterSpacing: 0.8),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '1',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(color: Colors.white24, height: 24),

              // Upcoming EMI row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'UPCOMING EMI • 7 Aug',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white70),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '₹407',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    ),
                    child: const Text('Pay Now', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800)),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.md),

        // 2. Autopay Banner
        Container(
          padding: const EdgeInsets.all(AppDimens.md),
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
                child: const Icon(Icons.event_repeat_rounded, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: AppDimens.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Don't miss a payment", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800)),
                    Text('Set autopay with UPI • Paytm, PhonePe, GPay', style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(borderRadius: AppDimens.roundedPill),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                ),
                child: const Text('Setup', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primary)),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.lg),

        // 3. Segmented Pill Tabs: EMIs to be paid | Completed EMIs
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F0FB),
            borderRadius: AppDimens.roundedPill,
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTab = 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: _selectedTab == 0 ? AppColors.surface : Colors.transparent,
                      borderRadius: AppDimens.roundedPill,
                      boxShadow: _selectedTab == 0 ? [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)] : null,
                    ),
                    child: Text(
                      'EMIs to be paid',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: _selectedTab == 0 ? FontWeight.w800 : FontWeight.w600,
                        color: _selectedTab == 0 ? AppColors.primary : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTab = 1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: _selectedTab == 1 ? AppColors.surface : Colors.transparent,
                      borderRadius: AppDimens.roundedPill,
                      boxShadow: _selectedTab == 1 ? [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)] : null,
                    ),
                    child: Text(
                      'Completed EMIs',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: _selectedTab == 1 ? FontWeight.w800 : FontWeight.w600,
                        color: _selectedTab == 1 ? AppColors.primary : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.lg),

        // 4. Monthly Table Header with Year Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Monthly table', style: AppTextStyles.h2),
                Text('All EMIs for each due month', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: AppDimens.roundedPill,
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: Row(
                children: const [
                  Text('2026', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                  SizedBox(width: 4),
                  Icon(Icons.keyboard_arrow_down_rounded, size: 16),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.md),

        // 5. Monthly EMI Cards List
        _buildMonthEmiCard('Aug 2026', '1 loan', '₹407'),
        _buildMonthEmiCard('Sep 2026', '1 loan', '₹407'),
        _buildMonthEmiCard('Oct 2026', '1 loan', '₹406'),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildMonthEmiCard(String month, String loanCount, String total) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.sm),
      padding: const EdgeInsets.all(AppDimens.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppDimens.roundedLg,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(month, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              Text(loanCount, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('TOTAL', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: AppColors.textMuted)),
                  Text(total, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
                ],
              ),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textMuted, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}
