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
              height: 180.0,
              padding: const EdgeInsets.fromLTRB(20.0, 22.0, 22.0, 28.0),
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
                  Transform.translate(
                    offset: const Offset(-18.0, 0.0),
                    child: CalorieProgressIndicator(
                      progress: progress,
                      calorieValue: calorieValue,
                      calorieLabel: calorieLabel,
                    ),
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
        Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(height: 18.0),
            Text(
              dateText,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF98A5A8),
              ),
            ),
          ],
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
    this.size = 128.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _CalorieProgressPainter(
              progress: progress,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                calorieValue,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                calorieLabel,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFBFC6C9),
                  height: 1.1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CalorieProgressPainter extends CustomPainter {
  final double progress;

  const _CalorieProgressPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const strokeWidth = 10.0;
    final arcRadius = (size.width - strokeWidth * 2) / 2;

    const startAngle = 135 * (math.pi / 180);
    const totalSweepAngle = 270 * (math.pi / 180);
    final activeSweepAngle = totalSweepAngle * progress.clamp(0.0, 1.0);
    final remainderSweepAngle = totalSweepAngle - activeSweepAngle;

    // 1. Outer dark ring (#102D34)
    final outerRingPaint = Paint()
      ..color = const Color(0xFF102D34)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, size.width * 0.44, outerRingPaint);

    // 2. Concentric Inner Circle 1 - Outer Gradient Layer
    final gradPaint1 = Paint()
      ..shader = ui.Gradient.radial(
        center,
        size.width * 0.37,
        const [Color(0xFF386775), Color(0xFF264F5B), Color(0xFF163642)],
        const [0.0, 0.7, 1.0],
      )
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, size.width * 0.37, gradPaint1);

    // 3. Concentric Inner Circle 2 - Mid Depth Gradient Layer
    final gradPaint2 = Paint()
      ..shader = ui.Gradient.radial(
        center,
        size.width * 0.31,
        const [Color(0xFF2B5461), Color(0xFF1B3E48), Color(0xFF112C35)],
        const [0.0, 0.6, 1.0],
      )
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, size.width * 0.31, gradPaint2);

    // 4. Concentric Inner Circle 3 - Core Center Radial Gradient
    final gradPaint3 = Paint()
      ..shader = ui.Gradient.radial(
        center,
        size.width * 0.25,
        const [Color(0xFF1F424D), Color(0xFF14313B), Color(0xFF0D222A)],
        const [0.0, 0.5, 1.0],
      )
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, size.width * 0.25, gradPaint3);

    // 5. Dark remainder arc on lower-right section
    if (remainderSweepAngle > 0) {
      final remainderPaint = Paint()
        ..color = const Color(0xFF14343B)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: arcRadius),
        startAngle + activeSweepAngle,
        remainderSweepAngle,
        false,
        remainderPaint,
      );
    }

    // 6. Subtle green glow behind green progress arc (#58CC6A)
    final glowPaint = Paint()
      ..color = const Color(0x3358CC6A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + 2.0
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: arcRadius),
      startAngle,
      activeSweepAngle,
      false,
      glowPaint,
    );

    // 7. Green progress arc (#58CC6A)
    final progressPaint = Paint()
      ..color = const Color(0xFF58CC6A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: arcRadius),
      startAngle,
      activeSweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CalorieProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
