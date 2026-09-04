import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../common_widgets/responsive_container.dart';
import '../shop/shop_screen.dart';
import 'nav_icons.dart';

class MainNavScreen extends StatelessWidget {
  const MainNavScreen({super.key, int initialIndex = 1});

  @override
  Widget build(BuildContext context) {
    const activeColor = AppColors.primary;
    const inactiveColor = Color(0xFF6B7280);

    return ResponsiveContainer(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: const SafeArea(
          bottom: false,
          child: ShopContentScreen(),
        ),

        // Production-Grade Fintech Bottom Navigation Bar
        bottomNavigationBar: Container(
          height: 64,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Color(0xFFF1F0FB), width: 1.5),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 1. Home
              _buildNavItem(
                iconWidget: NavIcons.home(color: inactiveColor, size: 24, isActive: false),
                label: 'Home',
                isActive: false,
              ),

              // 2. Shop (Active)
              _buildNavItem(
                iconWidget: NavIcons.shop(color: activeColor, size: 24, isActive: true),
                label: 'Shop',
                isActive: true,
              ),

              // 3. EMI Dues
              _buildNavItem(
                iconWidget: NavIcons.emiDues(color: inactiveColor, size: 24, isActive: false),
                label: 'EMI Dues',
                isActive: false,
              ),

              // 4. Limit
              _buildNavItem(
                iconWidget: NavIcons.limit(color: inactiveColor, size: 24, isActive: false),
                label: 'Limit',
                isActive: false,
              ),

              // 5. Profile
              _buildNavItem(
                iconWidget: NavIcons.profile(color: inactiveColor, size: 24, isActive: false),
                label: 'Profile',
                isActive: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required Widget iconWidget,
    required String label,
    required bool isActive,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top indicator bar for the active tab
          Container(
            height: 3,
            width: 36,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : Colors.transparent,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(3)),
            ),
          ),
          const SizedBox(height: 2),

          // 24px Optical Sized Icon
          SizedBox(
            width: 24,
            height: 24,
            child: Center(child: iconWidget),
          ),
          const SizedBox(height: 4),

          // Label
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              color: isActive ? AppColors.primary : const Color(0xFF6B7280),
              letterSpacing: -0.1,
            ),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
