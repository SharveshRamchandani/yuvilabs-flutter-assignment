import 'package:flutter/material.dart';
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
    this.segment1Color = const Color(0xFF5F67F6),
    this.segment2Color = const Color(0xFFF6D63B),
    this.segment3Color = const Color(0xFFF28A1A),
    this.backgroundColor = const Color(0xFFFAFAFA),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height / 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height / 2),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final totalWidth = constraints.maxWidth;

            const purpleLengthIncrease = 4.0;
            const overlap = 10.5; // +3.5px extra overlap
            const orangeLengthReduction = 2.5;

            final w1 = (totalWidth * segment1Ratio + overlap + purpleLengthIncrease).clamp(0.0, totalWidth);
            final w2 = (totalWidth * (segment1Ratio + segment2Ratio) + overlap).clamp(0.0, totalWidth);
            final w3 = (totalWidth * (segment1Ratio + segment2Ratio + segment3Ratio) - orangeLengthReduction).clamp(0.0, totalWidth);

            return Stack(
              clipBehavior: Clip.none,
              children: [
                // Track background
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(height / 2),
                    ),
                  ),
                ),

                // Segment 3 (Orange) - Back layer
                if (w3 > 0)
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: w3,
                    child: _buildCapsuleSegment(
                      gradientStart: const Color(0xFFFFBE58),
                      gradientEnd: const Color(0xFFF28A1A),
                      height: height,
                    ),
                  ),

                // Segment 2 (Yellow) - Middle layer (overlaps Segment 3)
                if (w2 > 0)
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: w2,
                    child: _buildCapsuleSegment(
                      gradientStart: const Color(0xFFFFF46A),
                      gradientEnd: const Color(0xFFF6D63B),
                      height: height,
                    ),
                  ),

                // Segment 1 (Purple) - Front layer (overlaps Segment 2)
                if (w1 > 0)
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: w1,
                    child: _buildCapsuleSegment(
                      gradientStart: const Color(0xFF5F67F6),
                      gradientEnd: const Color(0xFF8B7FFF),
                      height: height,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCapsuleSegment({
    required Color gradientStart,
    required Color gradientEnd,
    required double height,
  }) {
    final capsuleRadius = BorderRadius.circular(height / 2);

    return Container(
      decoration: BoxDecoration(
        borderRadius: capsuleRadius,
        boxShadow: [
          BoxShadow(
            color: gradientEnd.withValues(alpha: 0.12),
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: capsuleRadius,
        child: Stack(
          children: [
            // Vibrant left-to-right linear gradient base
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [gradientStart, gradientEnd],
                ),
              ),
            ),

            // Soft glossy highlight on top 30%
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: height * 0.45,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.6, 1.0],
                    colors: [
                      Colors.white.withValues(alpha: 0.14),
                      Colors.white.withValues(alpha: 0.03),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Subtle inner shadow at the bottom for depth
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: height * 0.35,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.12),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
