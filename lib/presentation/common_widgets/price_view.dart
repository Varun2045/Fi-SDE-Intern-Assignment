import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/currency_formatter.dart';

class PriceView extends StatelessWidget {
  final double price;
  final double? originalPrice;
  final bool showDiscountTag;
  final TextStyle? priceStyle;
  final double spacing;

  const PriceView({
    super.key,
    required this.price,
    this.originalPrice,
    this.showDiscountTag = true,
    this.priceStyle,
    this.spacing = AppDimens.xs,
  });

  @override
  Widget build(BuildContext context) {
    final hasDiscount = originalPrice != null && originalPrice! > price;
    final discountPercent = hasDiscount
        ? CurrencyFormatter.calculateDiscountPercent(originalPrice!, price)
        : 0;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: spacing,
      runSpacing: 2,
      children: [
        Text(
          CurrencyFormatter.format(price),
          style: priceStyle ?? AppTextStyles.h3.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.w700),
        ),
        if (hasDiscount)
          Text(
            CurrencyFormatter.format(originalPrice!),
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textMuted,
              decoration: TextDecoration.lineThrough,
              decorationColor: AppColors.textMuted,
            ),
          ),
        if (hasDiscount && showDiscountTag && discountPercent > 0)
          Text(
            '$discountPercent% OFF',
            style: AppTextStyles.badge.copyWith(
              color: AppColors.success,
              fontWeight: FontWeight.w700,
            ),
          ),
      ],
    );
  }
}
