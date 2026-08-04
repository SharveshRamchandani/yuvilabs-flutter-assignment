import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class CalorieLeftCard extends StatelessWidget {
  final String title;
  final String calorieValue;
  final String unitText;

  const CalorieLeftCard({
    super.key,
    this.title = 'Calorie left',
    this.calorieValue = '1256',
    this.unitText = 'Kcal',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTypography.calorieLeftTitle,
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Transform.scale(
              scaleY: 0.92,
              alignment: Alignment.centerLeft,
              child: Text(
                calorieValue,
                style: AppTypography.calorieLeftValue,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              unitText,
              style: AppTypography.calorieLeftUnit,
            ),
          ],
        ),
        const SizedBox(height: 18),
        const MultiSegmentProgressBar(),
      ],
    );
  }
}

class MultiSegmentProgressBar extends StatelessWidget {
  final double height;
  final double borderRadius;
  final double segment1Ratio;
  final double segment2Ratio;
  final double segment3Ratio;
  final Color segment1Color;
  final Color segment2Color;
  final Color segment3Color;
  final Color backgroundColor;

  const MultiSegmentProgressBar({
    super.key,
    this.height = 28.0,
    this.borderRadius = 14.0,
    this.segment1Ratio = 0.31,
    this.segment2Ratio = 0.12,
    this.segment3Ratio = 0.14,
    this.segment1Color = AppColors.calorieSegment1,
    this.segment2Color = AppColors.calorieSegment2,
    this.segment3Color = AppColors.calorieSegment3,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final totalWidth = constraints.maxWidth;
            final seg1Width = totalWidth * segment1Ratio;
            final seg2Width = totalWidth * (segment1Ratio + segment2Ratio);
            final seg3Width = totalWidth * (segment1Ratio + segment2Ratio + segment3Ratio);

            return Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: seg3Width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: segment3Color,
                      borderRadius: BorderRadius.circular(height / 2),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: seg2Width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: segment2Color,
                      borderRadius: BorderRadius.circular(height / 2),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: seg1Width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: segment1Color,
                      borderRadius: BorderRadius.circular(height / 2),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
