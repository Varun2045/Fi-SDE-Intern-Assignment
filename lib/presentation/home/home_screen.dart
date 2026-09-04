import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/constants/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onNavigateToShop;

  const HomeScreen({super.key, required this.onNavigateToShop});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.standard, vertical: AppDimens.md),
      children: [
        // 1. Limit Available Hero Card (Matching media_1788462281347.png)
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
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Limit Available Pill
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.accentGreen,
                      borderRadius: AppDimens.roundedPill,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.credit_card_rounded, size: 12, color: Colors.white),
                        SizedBox(width: 4),
                        Text(
                          'LIMIT AVAILABLE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppDimens.md),

                  // Remaining Amount
                  const Text(
                    '₹1,56,091',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const Text(
                    'REMAINING TO SPEND',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white70,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: AppDimens.lg),

                  // Shop Now Pill Button
                  ElevatedButton(
                    onPressed: onNavigateToShop,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: AppDimens.roundedPill),
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                    ),
                    child: const Text(
                      'Shop now',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),

              // 0% Interest graphic on right
              Positioned(
                top: 0,
                right: 0,
                child: Column(
                  children: const [
                    Text(
                      '0%',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      'INTEREST',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.md),

        // 2. Autopay Setup Card
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primarySoft,
                  borderRadius: AppDimens.roundedMd,
                ),
                child: const Icon(Icons.event_repeat_rounded, color: AppColors.primary, size: 24),
              ),
              const SizedBox(width: AppDimens.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Don't miss a payment",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Set autopay with UPI • Paytm, PhonePe, GPay',
                      style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary, width: 1.2),
                  shape: RoundedRectangleBorder(borderRadius: AppDimens.roundedPill),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text(
                  'Setup',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.lg),

        // 3. OFFERS Section (with purple bar indicator)
        Row(
          children: [
            Container(width: 3.5, height: 16, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 8),
            const Text(
              'OFFERS',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: AppColors.primary, letterSpacing: 0.8),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.sm),

        // Offers Carousel Card (MacBook Pro)
        InkWell(
          onTap: onNavigateToShop,
          borderRadius: AppDimens.roundedXl,
          child: Container(
            padding: const EdgeInsets.all(AppDimens.lg),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: AppDimens.roundedXl,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'EVERYDAY PRO PERFORMANCE',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Color(0xFFFFD166), letterSpacing: 0.5),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Get Your New MacBook\nfor Work',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white, height: 1.25),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(25),
                          borderRadius: AppDimens.roundedPill,
                        ),
                        child: const Text(
                          '✓ Starts at ₹2000/mo',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.laptop_mac_rounded, size: 64, color: Colors.white70),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppDimens.lg),

        // 4. OUR BRAND PARTNERS Section
        Row(
          children: [
            Container(width: 3.5, height: 16, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 8),
            const Text(
              'OUR BRAND PARTNERS',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: AppColors.primary, letterSpacing: 0.8),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.sm),

        // Brand Logos Horizontal Scroll
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildPartnerPill('Samsung', const Color(0xFF1428A0)),
              _buildPartnerPill('OnePlus', const Color(0xFFEB0029)),
              _buildPartnerPill('Reliance Digital', const Color(0xFF0066B2)),
              _buildPartnerPill('Croma', const Color(0xFF00B4D8)),
              _buildPartnerPill('Vijay Sales', const Color(0xFFD32F2F)),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.lg),

        // 5. WHY PAY WITH 1FI Section
        Row(
          children: [
            Container(width: 3.5, height: 16, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 8),
            const Text(
              'WHY PAY WITH 1FI',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: AppColors.primary, letterSpacing: 0.8),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.sm),
        Container(
          padding: const EdgeInsets.all(AppDimens.md),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: AppDimens.roundedLg,
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Row(
            children: const [
              Icon(Icons.savings_outlined, color: AppColors.primary, size: 28),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Keep your mutual fund investments growing while paying with 0% interest EMIs.',
                  style: AppTextStyles.bodySmall,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildPartnerPill(String name, Color color) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: AppDimens.sm),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppDimens.roundedLg,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              borderRadius: AppDimens.roundedMd,
            ),
            alignment: Alignment.center,
            child: Text(
              name[0],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: color),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
