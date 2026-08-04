import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class TodaysCaloriesCard extends StatelessWidget {
  final String caloriesValue;
  final String caloriesUnit;
  final String changeText;

  const TodaysCaloriesCard({
    super.key,
    this.caloriesValue = '856',
    this.caloriesUnit = 'kcal',
    this.changeText = '4.6%',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
      padding: const EdgeInsets.all(22.0),
      decoration: BoxDecoration(
        color: AppColors.navBackground,
        borderRadius: BorderRadius.circular(26.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20.0,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -11.0,
            bottom: -6.0,
            child: SizedBox(
              width: 115.0,
              height: 90.0,
              child: CustomPaint(
                painter: CaloriesTrendPainter(),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              _CaloriesValue(
                value: caloriesValue,
                unit: caloriesUnit,
              ),
              _BottomIndicator(
                changeText: changeText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  static const String _caloriesSvg = '''
<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#222222" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
  <path d="M12 2a10 10 0 1 0 10 10" />
  <circle cx="9.5" cy="14.5" r="2.5" stroke-width="1.8" />
  <circle cx="15.5" cy="9.5" r="1.5" stroke-width="1.8" />
</svg>
''';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 52.0,
          height: 52.0,
          decoration: BoxDecoration(
            color: AppColors.navBackground,
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFE8E8E8),
              width: 1.2,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/calories.svg',
              width: 20.0,
              height: 20.0,
              errorBuilder: (context, error, stackTrace) {
                return SvgPicture.string(
                  _caloriesSvg,
                  width: 20.0,
                  height: 20.0,
                );
              },
            ),
          ),
        ),
        Text(
          "Today's\nCalories",
          textAlign: TextAlign.right,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.4,
            color: const Color(0xFF111111),
            height: 1.0,
          ),
        ),
      ],
    );
  }
}

class _CaloriesValue extends StatelessWidget {
  final String value;
  final String unit;

  const _CaloriesValue({
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-4.0, -14.0),
      child: Transform.scale(
        scaleY: 0.92,
        alignment: Alignment.centerLeft,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -2.0,
                  height: 0.9,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 4.0),
              Transform.translate(
                offset: const Offset(0.0, 2.0),
                child: Text(
                  unit,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFA1A1A1),
                    height: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomIndicator extends StatelessWidget {
  final String changeText;

  const _BottomIndicator({
    required this.changeText,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0.0, 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/downarrow.svg',
            width: 18.0,
            height: 18.0,
            colorFilter: const ColorFilter.mode(
              Color(0xFF2B2B2B),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 6.0),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                changeText,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF2B2B2B),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CaloriesTrendPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    final p0 = Offset(0.0, size.height * 0.88);
    final p1 = Offset(size.width * 0.25, size.height * 0.62); 
    final v1 = Offset(size.width * 0.42, size.height * 0.74); 
    final p2 = Offset(size.width * 0.72, size.height * 0.12 + 4.0);
    final p3 = Offset(size.width + 8.0, size.height * 0.60 + 4.0);

    path.moveTo(p0.dx, p0.dy);
    path.quadraticBezierTo(
      size.width * 0.12,
      size.height * 0.72,
      p1.dx,
      p1.dy,
    );
    path.quadraticBezierTo(
      size.width * 0.34,
      size.height * 0.54,
      v1.dx,
      v1.dy,
    );
    path.quadraticBezierTo(
      size.width * 0.58,
      size.height * 0.42,
      p2.dx,
      p2.dy,
    );
    path.quadraticBezierTo(
      size.width * 0.86,
      size.height * 0.32,
      p3.dx,
      p3.dy,
    );

    final glowPaint = Paint()
      ..color = const Color(0x33F8C978)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.5);
    canvas.drawPath(path, glowPaint);

    final linePaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(size.width, 0),
        const [
          Color(0x33F8C978),
          Color(0xFFF8C978),
          Color(0xFFF5B55A),
          Color(0xFFEF972D),
          Color(0xFFF4B14F),
        ],
        const [0.0, 0.35, 0.60, 0.85, 1.0],
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, linePaint);

    final peakGlow = Paint()
      ..color = const Color(0x22F4B14F)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(p2, 6.0, peakGlow);

    final peakCircleOuter = Paint()
      ..color = const Color(0xFFF4B14F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(p2, 3.5, peakCircleOuter);

    final peakCircleInner = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(p2, 2.3, peakCircleInner);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
