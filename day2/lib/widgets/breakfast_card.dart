import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class BreakfastCard extends StatelessWidget {
  final String caloriesText;
  final String proteins;
  final String fats;
  final String carbs;
  final String rdc;

  const BreakfastCard({
    super.key,
    this.caloriesText = '250 Calories',
    this.proteins = '52.5',
    this.fats = '26.5',
    this.carbs = '85.8',
    this.rdc = '23%',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD0A1),
        borderRadius: BorderRadius.circular(26.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HeaderRow(caloriesText: caloriesText),
          const SizedBox(height: 26.0),
          _NutritionRow(
            proteins: proteins,
            fats: fats,
            carbs: carbs,
            rdc: rdc,
          ),
          const SizedBox(height: 20.0),
          const _BottomRow(),
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  final String caloriesText;

  const _HeaderRow({
    required this.caloriesText,
  });

  static const String _lightbulbSvg = '''
<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#F5A542" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M15 14c.2-1 .7-1.7 1.5-2.5 1-.9 1.5-2.2 1.5-3.5A6 6 0 0 0 6 8c0 1.3.5 2.6 1.5 3.5.8.8 1.3 1.5 1.5 2.5"/>
  <path d="M9 18h6"/>
  <path d="M10 22h4"/>
</svg>
''';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 46.0,
              height: 46.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/lightbulb.svg',
                  width: 20.0,
                  height: 20.0,
                  errorBuilder: (context, error, stackTrace) {
                    return SvgPicture.string(
                      _lightbulbSvg,
                      width: 20.0,
                      height: 20.0,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 14.0),
            Transform.translate(
              offset: const Offset(-3.0, -2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Breakfast',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.4,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    caloriesText,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF2B2B2B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: 48.0,
          height: 48.0,
          decoration: const BoxDecoration(
            color: Color(0xFFF5A542),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}

class _NutritionRow extends StatelessWidget {
  final String proteins;
  final String fats;
  final String carbs;
  final String rdc;

  const _NutritionRow({
    required this.proteins,
    required this.fats,
    required this.carbs,
    required this.rdc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _NutritionItem(heading: 'Proteins', value: proteins),
        _NutritionItem(heading: 'Fats', value: fats),
        _NutritionItem(heading: 'Carbs', value: carbs),
        _NutritionItem(heading: 'RDC', value: rdc),
      ],
    );
  }
}

class _NutritionItem extends StatelessWidget {
  final String heading;
  final String value;

  const _NutritionItem({
    required this.heading,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          heading,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF2B2B2B),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          value,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.6,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class _BottomRow extends StatelessWidget {
  const _BottomRow();

  static const String _editSvg = '''
<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#FFFFFF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"/>
</svg>
''';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 38.0,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: const Color(0xFFF5A542),
            borderRadius: BorderRadius.circular(19.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Today',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8.0),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 18.0,
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0.0, 4.0),
          child: Container(
            width: 48.0,
            height: 48.0,
            decoration: const BoxDecoration(
              color: Color(0xFFF5A542),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/edit.svg',
                width: 20.0,
                height: 20.0,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                errorBuilder: (context, error, stackTrace) {
                  return SvgPicture.string(
                    _editSvg,
                    width: 20.0,
                    height: 20.0,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
