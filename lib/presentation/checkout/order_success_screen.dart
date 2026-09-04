import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/currency_formatter.dart';
import '../../data/models/order_model.dart';
import '../common_widgets/custom_button.dart';
import '../common_widgets/responsive_container.dart';

class OrderSuccessScreen extends StatelessWidget {
  final OrderModel order;

  const OrderSuccessScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM yyyy').format(order.firstEmiDueDate);
    final monthlyEmi = order.selectedEmiPlan.getMonthlyEmi(order.finalPrice);

    return ResponsiveContainer(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.xl),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                // Animated Success Icon with Fintech Green
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF16A34A), width: 2.5),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check_rounded,
                      size: 52,
                      color: Color(0xFF16A34A),
                    ),
                  ),
                ),
                const SizedBox(height: AppDimens.xl),

                // Success Title
                const Text(
                  'Order Confirmed!',
                  style: AppTextStyles.h1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimens.xs),
                Text(
                  'Your 1Fi EMI loan has been instantly approved & disbursed.',
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimens.xl),

                // Receipt Card
                Container(
                  padding: const EdgeInsets.all(AppDimens.standard),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: AppDimens.roundedLg,
                    border: Border.all(color: AppColors.cardBorder),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 10, offset: const Offset(0, 2)),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildReceiptRow('Order ID', order.orderId),
                      const Divider(height: 20),
                      _buildReceiptRow('Loan Agreement', order.loanAgreementNumber),
                      const Divider(height: 20),
                      _buildReceiptRow('Product', order.product.name),
                      const Divider(height: 20),
                      _buildReceiptRow('Variant', '${order.selectedColor.name}, ${order.selectedStorage.label}'),
                      const Divider(height: 20),
                      _buildReceiptRow(
                        'Monthly EMI',
                        '${CurrencyFormatter.format(monthlyEmi)} x ${order.selectedEmiPlan.tenureMonths} Mo',
                        valueColor: AppColors.primary,
                      ),
                      const Divider(height: 20),
                      _buildReceiptRow('1st EMI Due Date', formattedDate, valueColor: AppColors.primary),
                    ],
                  ),
                ),

                const Spacer(),

                // Return to Shop Button (Clean typography)
                CustomButton(
                  text: 'Back to 1Fi Shop',
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
                const SizedBox(height: AppDimens.md),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReceiptRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted)),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: valueColor ?? AppColors.textPrimary,
            ),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
