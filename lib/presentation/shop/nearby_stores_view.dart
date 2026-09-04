import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/mock/mock_products_data.dart';

class NearbyStoresView extends StatelessWidget {
  const NearbyStoresView({super.key});

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
                'Search stores...',
                style: TextStyle(color: AppColors.textMuted, fontSize: 13),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimens.lg),

        // Section Title + City Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Nearby Stores', style: AppTextStyles.h2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                borderRadius: AppDimens.roundedPill,
              ),
              child: Row(
                children: const [
                  Text(
                    'Faridabad',
                    style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.primary, size: 16),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.md),

        // Store Cards List
        ...MockProductsData.nearbyStores.map((store) => _buildStoreCard(store)),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildStoreCard(NearbyStoreItem store) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo Container
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: store.logoBg,
              borderRadius: AppDimens.roundedMd,
              border: Border.all(color: AppColors.cardBorderLight),
            ),
            alignment: Alignment.center,
            child: Text(
              store.logoText ?? store.name[0],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 8,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(width: AppDimens.md),

          // Store Info & Distance
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        store.name,
                        style: AppTextStyles.h3.copyWith(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceElevated,
                        borderRadius: AppDimens.roundedPill,
                      ),
                      child: Text(
                        store.distance,
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textSecondary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  store.address,
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
