import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../providers/product_detail_provider.dart';

class VariantSelector extends StatelessWidget {
  const VariantSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductDetailProvider>();
    final product = provider.product;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Color Variant Section
        if (product.colorVariants.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('SELECT COLOR', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textMuted)),
              Text(
                provider.selectedColor.name,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primaryLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.sm),
          Wrap(
            spacing: 12,
            children: product.colorVariants.map((color) {
              final isSelected = color.id == provider.selectedColor.id;
              return GestureDetector(
                onTap: () => provider.selectColor(color),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: color.color,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white24, width: 1),
                    ),
                    child: isSelected
                        ? Icon(
                            Icons.check_rounded,
                            size: 18,
                            color: color.color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                          )
                        : null,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: AppDimens.lg),
        ],

        // Storage / Capacity Variant Section
        if (product.storageVariants.isNotEmpty) ...[
          const Text('SELECT CAPACITY', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textMuted)),
          const SizedBox(height: AppDimens.sm),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: product.storageVariants.map((storage) {
              final isSelected = storage.id == provider.selectedStorage.id;
              return InkWell(
                onTap: () => provider.selectStorage(storage),
                borderRadius: AppDimens.roundedMd,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary.withAlpha(30) : AppColors.surfaceElevated,
                    borderRadius: AppDimens.roundedMd,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.cardBorder,
                      width: isSelected ? 1.5 : 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        storage.label,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w700,
                          color: isSelected ? AppColors.primary : AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        CurrencyFormatter.format(storage.price),
                        style: AppTextStyles.bodySmall.copyWith(
                          color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
