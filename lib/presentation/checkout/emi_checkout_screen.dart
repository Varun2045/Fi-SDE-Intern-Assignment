import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/currency_formatter.dart';
import '../../data/models/emi_plan_model.dart';
import '../../data/models/product_model.dart';
import '../../data/models/product_variant_model.dart';
import '../../providers/checkout_provider.dart';
import '../common_widgets/custom_badge.dart';
import '../common_widgets/custom_button.dart';
import '../common_widgets/responsive_container.dart';
import 'order_success_screen.dart';

class EmiCheckoutScreen extends StatelessWidget {
  final ProductModel product;
  final ColorVariant color;
  final StorageVariant storage;
  final EmiPlanModel emiPlan;

  const EmiCheckoutScreen({
    super.key,
    required this.product,
    required this.color,
    required this.storage,
    required this.emiPlan,
  });

  @override
  Widget build(BuildContext context) {
    final checkout = context.watch<CheckoutProvider>();
    final monthlyEmi = emiPlan.getMonthlyEmi(storage.price);
    final totalPayable = emiPlan.getTotalPayable(storage.price);

    return ResponsiveContainer(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.surface,
          elevation: 0,
          title: const Text('Review Loan & Order', style: AppTextStyles.h3),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: AppColors.textPrimary),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimens.standard),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1Fi Credit Limit Status Banner (Green Gradient)
              Container(
                padding: const EdgeInsets.all(AppDimens.standard),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF16A34A), Color(0xFF15803D)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: AppDimens.roundedXl,
                  boxShadow: [
                    BoxShadow(color: const Color(0xFF16A34A).withAlpha(40), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.verified_rounded, color: Color(0xFF16A34A), size: 24),
                    ),
                    const SizedBox(width: AppDimens.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pre-Approved Limit: ${CurrencyFormatter.format(checkout.preApprovedCreditLimit)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Instant 1Fi Disbursal • Backed by Mutual Funds',
                            style: TextStyle(fontSize: 11, color: Colors.white.withAlpha(210)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimens.lg),

              // Selected Product Summary Card
              const Text('PRODUCT DETAILS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.textMuted)),
              const SizedBox(height: AppDimens.sm),
              Container(
                padding: const EdgeInsets.all(AppDimens.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppDimens.roundedLg,
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: AppDimens.roundedMd,
                      child: Container(
                        width: 70,
                        height: 70,
                        color: AppColors.surfaceElevated,
                        child: Image.network(
                          product.thumbnail,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => const Icon(Icons.devices, color: AppColors.textMuted),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppDimens.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name, style: AppTextStyles.h3.copyWith(fontSize: 14), maxLines: 1),
                          const SizedBox(height: 4),
                          Text(
                            'Variant: ${color.name} • ${storage.label}',
                            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            CurrencyFormatter.format(storage.price),
                            style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimens.lg),

              // EMI Terms Summary Card
              const Text('LOAN & EMI AGREEMENT', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.textMuted)),
              const SizedBox(height: AppDimens.sm),
              Container(
                padding: const EdgeInsets.all(AppDimens.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppDimens.roundedLg,
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Column(
                  children: [
                    _buildSummaryRow('Chosen Tenure', '${emiPlan.tenureMonths} Months'),
                    const SizedBox(height: 8),
                    _buildSummaryRow(
                      'Monthly Installment',
                      '${CurrencyFormatter.format(monthlyEmi)} / mo',
                      valueColor: AppColors.primary,
                      isBold: true,
                    ),
                    const SizedBox(height: 8),
                    _buildSummaryRow(
                      'Interest Rate',
                      emiPlan.isZeroCost ? '0% No-Cost EMI' : '${emiPlan.annualInterestRate}% p.a.',
                      valueColor: emiPlan.isZeroCost ? AppColors.success : AppColors.textPrimary,
                    ),
                    const SizedBox(height: 8),
                    _buildSummaryRow('Down Payment', '₹0 (Zero)'),
                    const SizedBox(height: 8),
                    _buildSummaryRow(
                      'Processing Fee',
                      emiPlan.processingFee == 0 ? 'FREE' : CurrencyFormatter.format(emiPlan.processingFee),
                    ),
                    const Divider(height: 20),
                    _buildSummaryRow(
                      'Total Repayment Amount',
                      CurrencyFormatter.format(totalPayable),
                      isBold: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimens.lg),

              // Delivery Address Card
              const Text('DELIVERY ADDRESS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.textMuted)),
              const SizedBox(height: AppDimens.sm),
              Container(
                padding: const EdgeInsets.all(AppDimens.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppDimens.roundedLg,
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on_outlined, color: AppColors.primary, size: 20),
                    const SizedBox(width: AppDimens.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Default Address', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              CustomBadge(text: 'HOME', type: BadgeType.primary),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            checkout.deliveryAddress,
                            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimens.xl),

              // Place Order CTA (Green, no tick)
              CustomButton(
                text: 'Confirm & Place Order',
                isLoading: checkout.isProcessing,
                backgroundColor: const Color(0xFF16A34A),
                textColor: Colors.white,
                onPressed: () async {
                  final success = await checkout.processOrder(
                    product: product,
                    color: color,
                    storage: storage,
                    emiPlan: emiPlan,
                  );
                  if (success && context.mounted && checkout.confirmedOrder != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => OrderSuccessScreen(order: checkout.confirmedOrder!),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: (isBold ? AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700) : AppTextStyles.bodySmall).copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: (isBold ? AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700) : AppTextStyles.bodySmall).copyWith(
            color: valueColor ?? AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
