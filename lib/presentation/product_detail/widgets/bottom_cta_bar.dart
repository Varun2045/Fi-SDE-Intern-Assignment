import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../providers/product_detail_provider.dart';
import '../../checkout/emi_checkout_screen.dart';
import '../../common_widgets/custom_button.dart';

class BottomCtaBar extends StatelessWidget {
  const BottomCtaBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductDetailProvider>();
    final selectedPlan = provider.selectedEmiPlan;

    return Container(
      padding: const EdgeInsets.all(AppDimens.standard),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: const Border(top: BorderSide(color: AppColors.cardBorder, width: 1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(80),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Selected EMI Summary
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${selectedPlan.tenureMonths}M Plan',
                        style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600),
                      ),
                      if (selectedPlan.isZeroCost) ...[
                        const SizedBox(width: 4),
                        const Text('• 0% No-Cost', style: TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.bold)),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${CurrencyFormatter.format(provider.currentMonthlyEmi)}/mo',
                    style: AppTextStyles.currencyBig.copyWith(
                      fontSize: 20,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    'Total ${CurrencyFormatter.format(provider.currentTotalPayable)}',
                    style: AppTextStyles.bodySmall.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppDimens.md),

            // Proceed CTA Button (Light lavender style)
            Expanded(
              flex: 6,
              child: CustomButton(
                text: 'Proceed Plan',
                icon: Icons.arrow_forward_rounded,
                isLight: true,
                height: 48,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => EmiCheckoutScreen(
                        product: provider.product,
                        color: provider.selectedColor,
                        storage: provider.selectedStorage,
                        emiPlan: provider.selectedEmiPlan,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
