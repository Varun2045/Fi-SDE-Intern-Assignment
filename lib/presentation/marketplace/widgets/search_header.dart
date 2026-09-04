import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../providers/marketplace_provider.dart';
import 'filter_modal.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader({super.key});

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MarketplaceProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.standard,
        vertical: AppDimens.sm,
      ),
      child: Row(
        children: [
          // Search Field
          Expanded(
            child: SizedBox(
              height: 46,
              child: TextField(
                controller: _searchController,
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  hintText: 'Search iPhone, M3, Sony, 5G...',
                  prefixIcon: const Icon(Icons.search_rounded, size: 20),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close_rounded, size: 18),
                          onPressed: () {
                            _searchController.clear();
                            provider.setSearchQuery('');
                          },
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(horizontal: AppDimens.md),
                ),
                onChanged: (val) {
                  provider.setSearchQuery(val);
                },
              ),
            ),
          ),
          const SizedBox(width: AppDimens.sm),

          // Filter Button
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: AppDimens.roundedLg,
                  border: Border.all(
                    color: provider.hasActiveFilters ? AppColors.primary : AppColors.cardBorder,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.tune_rounded,
                    size: 20,
                    color: provider.hasActiveFilters ? AppColors.primary : AppColors.textSecondary,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (ctx) => const FilterModal(),
                    );
                  },
                ),
              ),
              if (provider.hasActiveFilters)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
