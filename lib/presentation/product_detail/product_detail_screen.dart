import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/currency_formatter.dart';
import '../../data/models/product_model.dart';
import '../../providers/product_detail_provider.dart';
import '../common_widgets/responsive_container.dart';
import 'widgets/bottom_cta_bar.dart';
import 'widgets/emi_calculator_widget.dart';
import 'widgets/specs_section.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isVariantSectionExpanded = true;
  bool _arePlansVisible = true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailProvider(product: widget.product),
      child: ResponsiveContainer(
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.surface,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: AppColors.textPrimary),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text(
              'Pay using 1Fi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share_outlined, size: 22, color: AppColors.textPrimary),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Product link copied!'), duration: Duration(seconds: 2)),
                  );
                },
              ),
            ],
          ),
          body: Consumer<ProductDetailProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppDimens.standard),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Hero Card (as shown in "Pay using 1Fi" photo)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppDimens.lg),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: AppDimens.roundedXl,
                        border: Border.all(color: AppColors.cardBorder),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withAlpha(5), blurRadius: 10, offset: const Offset(0, 2)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Brand Pill Chip Top Left
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceElevated,
                              borderRadius: AppDimens.roundedPill,
                              border: Border.all(color: AppColors.cardBorder),
                            ),
                            child: Text(
                              widget.product.brand,
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                            ),
                          ),
                          const SizedBox(height: AppDimens.md),

                          // Centered Product Image
                          Center(
                            child: SizedBox(
                              height: 180,
                              child: Image.network(
                                widget.product.thumbnail,
                                fit: BoxFit.contain,
                                errorBuilder: (_, _, _) => const Icon(Icons.devices, size: 80, color: AppColors.textMuted),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppDimens.lg),

                    // Product Title & Share row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.name,
                            style: AppTextStyles.h1.copyWith(fontSize: 22),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.share_outlined, color: AppColors.textSecondary),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimens.lg),

                    // SECTION 1: SELECT YOUR VARIANT (Matching Screenshot 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'SELECT YOUR VARIANT',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.textMuted, letterSpacing: 0.5),
                        ),
                        IconButton(
                          icon: Icon(
                            _isVariantSectionExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                            color: AppColors.textSecondary,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() => _isVariantSectionExpanded = !_isVariantSectionExpanded);
                          },
                        ),
                      ],
                    ),
                    if (_isVariantSectionExpanded) ...[
                      const SizedBox(height: AppDimens.xs),
                      ...widget.product.storageVariants.map((variant) {
                        final isSelected = variant.id == provider.selectedStorage.id;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: AppDimens.sm),
                          child: InkWell(
                            onTap: () => provider.selectStorage(variant),
                            borderRadius: AppDimens.roundedLg,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              padding: const EdgeInsets.symmetric(horizontal: AppDimens.standard, vertical: AppDimens.md),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primarySoft.withAlpha(80) : AppColors.surface,
                                borderRadius: AppDimens.roundedLg,
                                border: Border.all(
                                  color: isSelected ? AppColors.primary : AppColors.cardBorder,
                                  width: isSelected ? 1.5 : 1.0,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                                    color: isSelected ? AppColors.primary : AppColors.textMuted,
                                    size: 20,
                                  ),
                                  const SizedBox(width: AppDimens.md),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '2026 • ${variant.label}',
                                          style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '${widget.product.name} ${variant.label}',
                                          style: AppTextStyles.bodySmall.copyWith(fontSize: 11),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    CurrencyFormatter.format(variant.price),
                                    style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: AppDimens.md),
                    ],

                    // SECTION 2: SUGGESTED AMOUNT BOX (Matching Screenshot 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'SUGGESTED AMOUNT',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.textMuted, letterSpacing: 0.5),
                        ),
                        Text(
                          'Edit if paying different amount',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textMuted),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimens.sm),

                    Container(
                      padding: const EdgeInsets.all(AppDimens.standard),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: AppDimens.roundedLg,
                        border: Border.all(color: AppColors.cardBorder),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                CurrencyFormatter.format(provider.currentPrice),
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
                              ),
                              const Icon(Icons.edit_outlined, size: 18, color: AppColors.textMuted),
                            ],
                          ),
                          const Divider(height: 20),

                          // Starts at ₹X/mo & Hide Plans Toggle
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Starts at ${CurrencyFormatter.format(provider.currentMonthlyEmi)}/mo',
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.primary),
                              ),
                              GestureDetector(
                                onTap: () => setState(() => _arePlansVisible = !_arePlansVisible),
                                child: Row(
                                  children: [
                                    Text(
                                      _arePlansVisible ? 'Hide plans' : 'View plans',
                                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary),
                                    ),
                                    Icon(
                                      _arePlansVisible ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                                      size: 16,
                                      color: AppColors.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          if (_arePlansVisible) ...[
                            const SizedBox(height: AppDimens.md),
                            // Quick Plan Rows
                            ...widget.product.emiPlans.map((plan) {
                              final isSelected = plan.id == provider.selectedEmiPlan.id;
                              final emi = plan.getMonthlyEmi(provider.currentPrice);
                              return InkWell(
                                onTap: () => provider.selectEmiPlan(plan),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: isSelected ? AppColors.primarySoft.withAlpha(60) : Colors.transparent,
                                    borderRadius: AppDimens.roundedSm,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${plan.tenureMonths} months • ${plan.isZeroCost ? "0% No-Cost" : "${plan.annualInterestRate}% p.a."}',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                          color: isSelected ? AppColors.primary : AppColors.textSecondary,
                                        ),
                                      ),
                                      Text(
                                        '${CurrencyFormatter.format(emi)} /mo',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                                          color: isSelected ? AppColors.primary : AppColors.textPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: AppDimens.lg),

                    // SECTION 3: Detailed EMI Calculator and Cost Breakdown
                    const EmiCalculatorWidget(),
                    const SizedBox(height: AppDimens.lg),

                    // SECTION 4: Product Specs & Details
                    SpecsSection(product: widget.product),
                    const SizedBox(height: 80),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: const BottomCtaBar(),
        ),
      ),
    );
  }
}
