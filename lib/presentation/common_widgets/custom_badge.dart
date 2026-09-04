import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';
import '../../core/constants/app_text_styles.dart';

enum BadgeType { primary, secondary, warning, gold, dark }

class CustomBadge extends StatelessWidget {
  final String text;
  final BadgeType type;
  final IconData? icon;

  const CustomBadge({
    super.key,
    required this.text,
    this.type = BadgeType.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    Border? border;

    switch (type) {
      case BadgeType.primary:
        bgColor = AppColors.primarySoft;
        textColor = AppColors.primary;
        border = Border.all(color: AppColors.primary.withAlpha(50), width: 0.8);
        break;
      case BadgeType.secondary:
        bgColor = const Color(0xFFE0F2FE);
        textColor = const Color(0xFF0284C7);
        border = Border.all(color: const Color(0xFFBAE6FD), width: 0.8);
        break;
      case BadgeType.warning:
        bgColor = const Color(0xFFFEF3C7);
        textColor = const Color(0xFFD97706);
        border = Border.all(color: const Color(0xFFFDE68A), width: 0.8);
        break;
      case BadgeType.gold:
        bgColor = const Color(0xFFFFFBEB);
        textColor = const Color(0xFFB45309);
        border = Border.all(color: const Color(0xFFFCD34D), width: 0.8);
        break;
      case BadgeType.dark:
        bgColor = AppColors.surfaceElevated;
        textColor = AppColors.textSecondary;
        border = Border.all(color: AppColors.cardBorder, width: 0.8);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: AppDimens.roundedPill,
        border: border,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: AppTextStyles.badge.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
