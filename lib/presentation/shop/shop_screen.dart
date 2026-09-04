import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../marketplace/marketplace_view.dart';
import 'placeholder_tab.dart';

class ShopContentScreen extends StatefulWidget {
  const ShopContentScreen({super.key});

  @override
  State<ShopContentScreen> createState() => _ShopContentScreenState();
}

class _ShopContentScreenState extends State<ShopContentScreen> {
  int _selectedTabIndex = 2; // 0: Top Brands (blank), 1: Nearby Stores (blank), 2: 1Fi Marketplace (fully implemented)

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Purple Hero Banner (Matching official 1Fi Shop screenshot)
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: AppColors.heroGradient,
          ),
          padding: const EdgeInsets.fromLTRB(
            AppDimens.standard,
            AppDimens.md,
            AppDimens.standard,
            AppDimens.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sparkles & No-Cost EMIs Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(30),
                  borderRadius: AppDimens.roundedPill,
                  border: Border.all(color: Colors.white.withAlpha(50)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.auto_awesome, size: 14, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      'NO-COST EMIs',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimens.sm),

              // Headline and Right 3D Illustration Graphic
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Shop today,\nPay later using\nMutual funds.',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'No credit score required. No interest.\nBacked by your investments.',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withAlpha(210),
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),

                  // 3D Lifestyle & Shopping Illustration (Matching Reference Photo)
                  Expanded(
                    flex: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/hero_shopping.jpg',
                        height: 125,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(20),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.shopping_bag_rounded,
                              size: 48,
                              color: Color(0xFFFFD166),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Segmented Capsule Tab Bar (Top Brands, Nearby Stores, 1Fi Marketplace)
        Container(
          color: AppColors.background,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.standard,
            vertical: AppDimens.md,
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F0FB),
              borderRadius: AppDimens.roundedPill,
            ),
            child: Row(
              children: [
                _buildTabButton(0, 'Top Brands'),
                _buildTabButton(1, 'Nearby Stores'),
                _buildTabButton(2, '1Fi Marketplace', isSpecial: true),
              ],
            ),
          ),
        ),

        // Main Tab View
        Expanded(
          child: IndexedStack(
            index: _selectedTabIndex,
            children: const [
              // Top Brands: Blank as per assignment instructions (Section 2.A)
              BlankTab(title: 'Top Brands'),
              // Nearby Stores: Blank as per assignment instructions (Section 2.B)
              BlankTab(title: 'Nearby Stores'),
              // 1Fi Marketplace: Fully implemented (Section 2.C)
              MarketplaceView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(int index, String title, {bool isSpecial = false}) {
    final isSelected = _selectedTabIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _selectedTabIndex = index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.surface : Colors.transparent,
            borderRadius: AppDimens.roundedPill,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withAlpha(15),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                  color: isSelected ? AppColors.primary : AppColors.textSecondary,
                ),
              ),
              if (isSelected) ...[
                const SizedBox(height: 2),
                Container(
                  width: 24,
                  height: 2.5,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: AppDimens.roundedPill,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Alias for backward compatibility
typedef ShopScreen = ShopContentScreen;
