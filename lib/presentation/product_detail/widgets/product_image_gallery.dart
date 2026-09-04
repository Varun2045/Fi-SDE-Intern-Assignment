import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../providers/product_detail_provider.dart';
import '../../common_widgets/custom_badge.dart';

class ProductImageGallery extends StatelessWidget {
  const ProductImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductDetailProvider>();
    final product = provider.product;
    final images = product.images.isNotEmpty ? product.images : [product.thumbnail];

    return Column(
      children: [
        // Main Image Frame
        Stack(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              color: AppColors.surface,
              child: PageView.builder(
                itemCount: images.length,
                onPageChanged: (index) => provider.setActiveImageIndex(index),
                itemBuilder: (context, index) {
                  return Image.network(
                    images[index],
                    fit: BoxFit.contain,
                    errorBuilder: (_, _, _) => Container(
                      color: AppColors.surfaceElevated,
                      child: const Icon(
                        Icons.devices_other_rounded,
                        size: 64,
                        color: AppColors.textMuted,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Top Badges
            Positioned(
              top: AppDimens.md,
              left: AppDimens.md,
              child: Row(
                children: [
                  if (product.badge != null) ...[
                    CustomBadge(text: product.badge!, type: BadgeType.gold),
                    const SizedBox(width: 8),
                  ],
                  if (product.isZeroCostEmiAvailable)
                    const CustomBadge(text: '0% EMI Eligible', type: BadgeType.primary),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.sm),

        // Indicator dots
        if (images.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: provider.activeImageIndex == index ? 20 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: provider.activeImageIndex == index ? AppColors.primary : AppColors.cardBorder,
                  borderRadius: AppDimens.roundedPill,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
