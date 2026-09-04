import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class BlankTab extends StatelessWidget {
  final String title;

  const BlankTab({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Center(
        child: Text(
          '',
          style: TextStyle(color: AppColors.textMuted),
        ),
      ),
    );
  }
}

// Alias for compatibility
typedef PlaceholderTab = BlankTab;
