import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final Color backgroundColor;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.maxWidth = AppDimens.maxContentWidth,
    this.backgroundColor = AppColors.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF26184E), // Deep violet desktop backdrop canvas
      alignment: Alignment.center,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(60),
                  blurRadius: 25,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
