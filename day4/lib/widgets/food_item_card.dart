import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import '../theme/app_typography.dart';

class FoodItemCard extends StatelessWidget {
  final String title;
  final int calories;
  final String carbs;
  final Color backgroundColor;
  final Color caloriesAccent;
  final Color carbsAccent;

  const FoodItemCard({
    super.key,
    required this.title,
    required this.calories,
    required this.carbs,
    required this.backgroundColor,
    required this.caloriesAccent,
    required this.carbsAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 188.0,
      padding: const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 14.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(26.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 10.0),
          _buildMetric(
            value: '$calories',
            label: 'Calories',
            accentColor: caloriesAccent,
          ),
          const SizedBox(height: 12.0),
          _buildMetric(
            value: carbs,
            label: 'Carbs',
            accentColor: carbsAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.translate(
          offset: const Offset(2.0, 4.0),
          child: Text(
            title,
            style: AppTypography.foodCardTitle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 4.0, right: 4.0),
          child: Icon(
            LucideIcons.ellipsisVertical,
            size: 16.0,
            color: Color(0xFF111111),
          ),
        ),
      ],
    );
  }

  Widget _buildMetric({
    required String value,
    required String label,
    required Color accentColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIndicator(accentColor),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: AppTypography.foodCardMetricValue,
            ),
            const SizedBox(height: 4.0),
            Text(
              label,
              style: AppTypography.foodCardMetricLabel,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIndicator(Color accentColor) {
    return Container(
      width: 8.0,
      height: 42.0,
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 8.0,
              height: 18.0,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
