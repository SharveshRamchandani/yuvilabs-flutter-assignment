import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class Day0Card extends StatelessWidget {
  final String title;
  final String subtitle;

  const Day0Card({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBadge(),
          const SizedBox(height: 16),
          _buildTitle(),
          const SizedBox(height: 8),
          _buildSubtitle(),
        ],
      ),
    );
  }

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.limeAccent,
        borderRadius: BorderRadius.circular(12),
      ), 
      child: const Text(
        'DAY 0 READY',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.darkCard,
        ),   
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: AppTypography.cardTitle.copyWith(color: AppColors.textWhite),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      subtitle,
      style: AppTypography.bodyText.copyWith(color: AppColors.textSecondary),
    );
  }
}
