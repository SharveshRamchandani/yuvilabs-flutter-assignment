import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressCard extends StatelessWidget {
  final double progress;
  final String progressText;
  final String title;
  final String dateText;
  final String calorieValue;
  final String calorieLabel;

  const ProgressCard({
    super.key,
    this.progress = 0.82,
    this.progressText = '82%',
    this.title = 'Your Progress',
    this.dateText = '19 Jan',
    this.calorieValue = '1252',
    this.calorieLabel = 'Calories',
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;

        return Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -10,
              child: SizedBox(
                width: cardWidth * 0.80,
                child: Container(
                  height: 14.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFAFC9CF),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 200.0,
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 22.0, 20.0),
              decoration: BoxDecoration(
                color: const Color(0xFF0C252A),
                borderRadius: BorderRadius.circular(28.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _LeftColumn(
                    title: title,
                    progressText: progressText,
                    dateText: dateText,
                  ),
                  CalorieProgressIndicator(
                    progress: progress,
                    calorieValue: calorieValue,
                    calorieLabel: calorieLabel,
                    size: 124.0,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LeftColumn extends StatelessWidget {
  final String title;
  final String progressText;
  final String dateText;

  const _LeftColumn({
    required this.title,
    required this.progressText,
    required this.dateText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10.0),
            Transform.translate(
              offset: const Offset(-4.0, 0.0),
              child: Text(
                progressText,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF58CC6A),
                  height: 1.0,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            dateText,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF98A5A8),
            ),
          ),
        ),
      ],
    );
  }
}

class CalorieProgressIndicator extends StatelessWidget {
  final double progress;
  final String calorieValue;
  final String calorieLabel;
  final double size;

  const CalorieProgressIndicator({
    super.key,
    this.progress = 0.82,
    this.calorieValue = '1252',
    this.calorieLabel = 'Calories',
    this.size = 124.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Layers 1 to 7: Radial glow, dark arc, progress arc, decorative rings, layered radial gradient circles
          CustomPaint(
            size: Size(size, size),
            painter: _CalorieGaugePainter(
              progress: progress,
            ),
          ),
          // Layer 8: Center text ("1252" and "Calories")
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                calorieValue,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.0,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 3.0),
              Text(
                calorieLabel,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFB0C4C7),
                  height: 1.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CalorieGaugePainter extends CustomPainter {
  final double progress;

  const _CalorieGaugePainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    const strokeWidth = 9.0;
    final arcRadius = (size.width - strokeWidth - 8.0) / 2;
    const startAngle = 135 * (math.pi / 180);
    const totalSweepAngle = 270 * (math.pi / 180);
    final activeSweepAngle = totalSweepAngle * progress.clamp(0.0, 1.0);

    // Subtle background arc
    final darkArcPaint = Paint()
      ..color = const Color(0x330B2326)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: arcRadius),
      startAngle,
      totalSweepAngle,
      false,
      darkArcPaint,
    );

    // Soft green progress arc (#4CAF5F -> #58CC6A -> #49B55A)
    if (activeSweepAngle > 0) {
      final sweepGradient = ui.Gradient.sweep(
        center,
        const [
          Color(0xFF4CAF5F),
          Color(0xFF58CC6A),
          Color(0xFF49B55A),
        ],
        const [0.0, 0.75, 1.0],
        TileMode.clamp,
        startAngle,
        startAngle + totalSweepAngle,
      );

      final progressArcPaint = Paint()
        ..shader = sweepGradient
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: arcRadius),
        startAngle,
        activeSweepAngle,
        false,
        progressArcPaint,
      );
    }

    // Glass lens center with upper-left highlight (Alignment(-0.35, -0.35)) & darkened lower portion
    final lensRadius = arcRadius - strokeWidth / 2 - 4.0;
    final lightSourceCenter = Offset(
      center.dx + lensRadius * -0.35,
      center.dy + lensRadius * -0.35,
    );

    final lensGradient = ui.Gradient.radial(
      lightSourceCenter,
      lensRadius * 1.40,
      const [
        Color(0xFF32626C),
        Color(0xFF214A53),
        Color(0xFF14343B),
        Color(0xFF091C20),
      ],
      const [0.0, 0.38, 0.72, 1.0],
    );

    final lensPaint = Paint()
      ..shader = lensGradient
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, lensRadius, lensPaint);

    // Extremely thin border ring (approx 3% white opacity)
    final thinBorderPaint = Paint()
      ..color = const Color(0x08FFFFFF) // 3% white opacity
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawCircle(center, lensRadius, thinBorderPaint);
  }

  @override
  bool shouldRepaint(covariant _CalorieGaugePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
