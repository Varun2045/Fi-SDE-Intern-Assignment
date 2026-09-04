import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/constants/app_text_styles.dart';
import '../../providers/marketplace_provider.dart';
import '../common_widgets/empty_state_view.dart';
import '../common_widgets/shimmer_box.dart';
import 'widgets/category_selector.dart';
import 'widgets/product_card.dart';
import 'widgets/promo_banner.dart';
import 'widgets/search_header.dart';

class MarketplaceView extends StatelessWidget {
  const MarketplaceView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MarketplaceProvider>();

    return RefreshIndicator(
      color: AppColors.primary,
      backgroundColor: AppColors.surfaceElevated,
      onRefresh: () => provider.fetchProducts(),
      child: CustomScrollView(
        slivers: [
          // Sticky / Top Search & Filters
          const SliverToBoxAdapter(
            child: SearchHeader(),
          ),

          // Categories Horizontal Scroll Bar
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimens.xs),
              child: CategorySelector(),
            ),
          ),

          // Promotional Hero Banner (shown when viewing all categories without search)
          if (provider.selectedCategoryId == 'all' && provider.searchQuery.isEmpty)
            const SliverToBoxAdapter(
              child: PromoBanner(),
            ),

          // Section Header: Result count & Current view title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.standard,
                AppDimens.md,
                AppDimens.standard,
                AppDimens.sm,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      provider.selectedCategoryId == 'all'
                          ? 'All Marketplace Products'
                          : provider.activeCategory?.name ?? 'Products',
                      style: AppTextStyles.h3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (!provider.isLoading) ...[
                    const SizedBox(width: 8),
                    Text(
                      '${provider.products.length} Items',
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Main Content: Loading, Error, Empty, or Product Grid
          if (provider.isLoading)
            _buildLoadingSliver()
          else if (provider.errorMessage != null)
            SliverFillRemaining(
              hasScrollBody: false,
              child: EmptyStateView(
                title: 'Unable to Load Products',
                message: provider.errorMessage!,
                icon: Icons.cloud_off_rounded,
                buttonText: 'Try Again',
                onButtonPressed: () => provider.fetchProducts(),
              ),
            )
          else if (provider.products.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: EmptyStateView(
                title: 'No Matching Products',
                message: 'No products match your current filters or search terms.',
                icon: Icons.search_off_rounded,
                buttonText: 'Reset Filters',
                onButtonPressed: () => provider.resetFilters(),
              ),
            )
          else
            _buildProductGridSliver(provider),

          // Bottom padding for scroll clearance
          const SliverToBoxAdapter(
            child: SizedBox(height: 80),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingSliver() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.standard),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppDimens.md,
          crossAxisSpacing: AppDimens.md,
          childAspectRatio: 0.58,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => const ShimmerBox(
            height: 280,
            borderRadius: AppDimens.roundedLg,
          ),
          childCount: 4,
        ),
      ),
    );
  }

  Widget _buildProductGridSliver(MarketplaceProvider provider) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.standard),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppDimens.md,
          crossAxisSpacing: AppDimens.md,
          childAspectRatio: 0.68,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = provider.products[index];
            return ProductCard(product: product);
          },
          childCount: provider.products.length,
        ),
      ),
    );
  }
}
