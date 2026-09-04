import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/mock/mock_products_data.dart';

class TopBrandsView extends StatelessWidget {
  const TopBrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.standard, vertical: AppDimens.md),
      children: [
        // Search bar
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: AppDimens.roundedPill,
            border: Border.all(color: AppColors.cardBorder),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.standard),
          child: Row(
            children: const [
              Icon(Icons.search_rounded, color: AppColors.textMuted, size: 20),
              SizedBox(width: 8),
              Text(
                'Search online stores...',
                style: TextStyle(color: AppColors.textMuted, fontSize: 13),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.lg),

        // Section Title
        const Text('Top Brands', style: AppTextStyles.h2),
        const SizedBox(height: AppDimens.md),

        // Brand Cards List
        ...MockProductsData.topBrands.map((brand) => _buildBrandCard(brand)),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildBrandCard(BrandItem brand) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.md),
      padding: const EdgeInsets.all(AppDimens.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppDimens.roundedLg,
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo Container
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: brand.logoBg,
              borderRadius: AppDimens.roundedMd,
            ),
            alignment: Alignment.center,
            child: brand.icon != null
                ? Icon(brand.icon, color: Colors.white, size: 28)
                : Text(
                    brand.logoText ?? brand.name[0],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                    ),
                  ),
          ),
          const SizedBox(width: AppDimens.md),

          // Brand Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  brand.name,
                  style: AppTextStyles.h3.copyWith(fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  brand.subtitle,
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
