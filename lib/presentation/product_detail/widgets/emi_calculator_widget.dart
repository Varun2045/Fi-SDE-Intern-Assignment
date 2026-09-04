import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/emi_calculator.dart';
import '../../../data/models/emi_plan_model.dart';
import '../../../providers/product_detail_provider.dart';
import '../../common_widgets/custom_badge.dart';

class EmiCalculatorWidget extends StatelessWidget {
  const EmiCalculatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductDetailProvider>();
    final product = provider.product;
    final selectedPlan = provider.selectedEmiPlan;
    final currentPrice = provider.currentPrice;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppDimens.roundedXl,
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      padding: const EdgeInsets.all(AppDimens.standard),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('1Fi EMI Plans', style: AppTextStyles.h3),
              CustomBadge(text: 'Instant Approval', type: BadgeType.primary),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Choose your flexible repayment tenure with 0% downpayment',
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppDimens.md),

          // Plan Selection Cards (Horizontal / Grid)
          Column(
            children: product.emiPlans.map((plan) {
              final isSelected = plan.id == selectedPlan.id;
              final monthlyEmi = plan.getMonthlyEmi(currentPrice);

              return Padding(
                padding: const EdgeInsets.only(bottom: AppDimens.sm),
                child: InkWell(
                  onTap: () => provider.selectEmiPlan(plan),
                  borderRadius: AppDimens.roundedLg,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.all(AppDimens.md),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary.withAlpha(25) : AppColors.surfaceElevated,
                      borderRadius: AppDimens.roundedLg,
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.cardBorder,
                        width: isSelected ? 1.5 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        // Radio Indicator
                        Icon(
                          isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                          size: 20,
                          color: isSelected ? AppColors.primary : AppColors.textMuted,
                        ),
                        const SizedBox(width: AppDimens.md),

                        // Tenure & Monthly Installment
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${plan.tenureMonths} Months',
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  if (plan.specialOfferTag != null) ...[
                                    const SizedBox(width: 8),
                                    CustomBadge(
                                      text: plan.specialOfferTag!,
                                      type: plan.isZeroCost ? BadgeType.primary : BadgeType.dark,
                                    ),
                                  ],
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${CurrencyFormatter.format(monthlyEmi)} / month',
                                style: AppTextStyles.emiHighlight.copyWith(
                                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Rate Tag
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              plan.isZeroCost ? '0% Interest' : '${plan.annualInterestRate}% p.a.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: plan.isZeroCost ? AppColors.success : AppColors.textSecondary,
                              ),
                            ),
                            Text(
                              '₹0 Downpayment',
                              style: AppTextStyles.bodySmall.copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: AppDimens.sm),

          // Selected Plan Breakdown Card
          _buildPlanBreakdown(selectedPlan, currentPrice, context),
        ],
      ),
    );
  }

  Widget _buildPlanBreakdown(EmiPlanModel plan, double productPrice, BuildContext context) {
    final monthlyEmi = plan.getMonthlyEmi(productPrice);
    final totalInterest = plan.getTotalInterest(productPrice);
    final totalPayable = plan.getTotalPayable(productPrice);
    final savings = plan.getZeroCostSavings(productPrice);

    return Container(
      padding: const EdgeInsets.all(AppDimens.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: AppDimens.roundedLg,
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'PLAN COST BREAKDOWN',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.textMuted, letterSpacing: 0.5),
              ),
              if (plan.isZeroCost && savings > 0)
                Text(
                  'Saved ${CurrencyFormatter.format(savings)} on Interest',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primaryLight),
                ),
            ],
          ),
          const Divider(height: 16),

          _buildBreakdownRow('Net Principal Amount', CurrencyFormatter.format(productPrice)),
          const SizedBox(height: 6),
          _buildBreakdownRow('Down Payment', '₹0 (Zero)'),
          const SizedBox(height: 6),
          _buildBreakdownRow(
            'Interest (${plan.annualInterestRate}% p.a.)',
            plan.isZeroCost ? '₹0 (No-Cost Subsidy)' : CurrencyFormatter.format(totalInterest),
            valueColor: plan.isZeroCost ? AppColors.success : AppColors.textPrimary,
          ),
          const SizedBox(height: 6),
          _buildBreakdownRow(
            'Processing Fee',
            plan.processingFee == 0 ? 'FREE' : CurrencyFormatter.format(plan.processingFee),
            valueColor: plan.processingFee == 0 ? AppColors.success : AppColors.textPrimary,
          ),
          const Divider(height: 16),

          _buildBreakdownRow(
            'Total Amount Payable',
            CurrencyFormatter.format(totalPayable),
            isBold: true,
          ),
          const SizedBox(height: 4),
          _buildBreakdownRow(
            'Monthly Installment',
            '${CurrencyFormatter.format(monthlyEmi)} x ${plan.tenureMonths} Months',
            isBold: true,
            valueColor: AppColors.primary,
          ),

          const SizedBox(height: 12),

          // View Amortisation Schedule Button
          Center(
            child: TextButton.icon(
              onPressed: () => _showScheduleDialog(context, plan, productPrice),
              icon: const Icon(Icons.table_chart_outlined, size: 16, color: AppColors.secondary),
              label: const Text(
                'View Month-by-Month Schedule',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakdownRow(String label, String value, {bool isBold = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold ? AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700) : AppTextStyles.bodySmall,
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

  void _showScheduleDialog(BuildContext context, EmiPlanModel plan, double price) {
    final schedule = EmiCalculator.generateSchedule(
      principal: price,
      annualInterestRate: plan.annualInterestRate,
      tenureMonths: plan.tenureMonths,
    );

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: AppDimens.roundedXl),
        title: Row(
          children: [
            const Icon(Icons.calendar_month_rounded, color: AppColors.primary),
            const SizedBox(width: 8),
            Text('${plan.tenureMonths}-Month Repayment Schedule', style: AppTextStyles.h3),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: AppDimens.roundedSm,
                ),
                child: const Row(
                  children: [
                    Expanded(flex: 1, child: Text('Month', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11))),
                    Expanded(flex: 2, child: Text('EMI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11))),
                    Expanded(flex: 2, child: Text('Principal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11))),
                    Expanded(flex: 2, child: Text('Interest', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11))),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 260),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: schedule.length,
                  separatorBuilder: (_, _) => const Divider(height: 8),
                  itemBuilder: (context, idx) {
                    final item = schedule[idx];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: Text('M${item.monthNumber}', style: AppTextStyles.bodySmall)),
                          Expanded(
                            flex: 2,
                            child: Text(
                              CurrencyFormatter.format(item.monthlyInstallment),
                              style: AppTextStyles.bodySmall.copyWith(color: AppColors.primary),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(CurrencyFormatter.format(item.principalAmount), style: AppTextStyles.bodySmall),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(CurrencyFormatter.format(item.interestAmount), style: AppTextStyles.bodySmall),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Close', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}
