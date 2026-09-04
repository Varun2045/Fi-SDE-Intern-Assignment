import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../providers/marketplace_provider.dart';
import '../../common_widgets/shimmer_box.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MarketplaceProvider>();

    if (provider.isCategoriesLoading) {
      return SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.standard),
          itemCount: 5,
          separatorBuilder: (_, _) => const SizedBox(width: AppDimens.sm),
          itemBuilder: (_, _) => const ShimmerBox(width: 90, height: 36, borderRadius: AppDimens.roundedPill),
        ),
      );
    }

    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.standard),
        itemCount: provider.categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppDimens.sm),
        itemBuilder: (context, index) {
          final category = provider.categories[index];
          final isSelected = category.id == provider.selectedCategoryId;

          return InkWell(
            onTap: () => provider.selectCategory(category.id),
            borderRadius: AppDimens.roundedPill,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary.withAlpha(35) : AppColors.surfaceElevated,
                borderRadius: AppDimens.roundedPill,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.cardBorder,
                  width: isSelected ? 1.5 : 1.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    category.icon,
                    size: 16,
                    color: isSelected ? AppColors.primary : AppColors.textSecondary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    category.name,
                    style: AppTextStyles.tabLabel.copyWith(
                      color: isSelected ? AppColors.primary : AppColors.textSecondary,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
