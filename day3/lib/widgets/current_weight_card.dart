import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import '../theme/app_colors.dart';

class CurrentWeightCard extends StatelessWidget {
  final String currentWeight;
  final String weightUnit;
  final String changeText;

  const CurrentWeightCard({
    super.key,
    this.currentWeight = '82.6',
    this.weightUnit = 'kg',
    this.changeText = '3 kg (-3.8%)',
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _HeaderSection(),
          _WeightValueSection(
            weight: currentWeight,
            unit: weightUnit,
          ),
          _ChangeIndicatorSection(
            changeText: changeText,
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFE8E8E8),
              width: 1.2,
            ),
          ),
          child: const Center(
            child: Icon(
              LucideIcons.zap,
              size: 22,
              color: Color(0xFF222222),
            ),
          ),
        ),
        Text(
          'Current\nWeight',
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

class _WeightValueSection extends StatelessWidget {
  final String weight;
  final String unit;

  const _WeightValueSection({
    required this.weight,
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
                weight,
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

class _ChangeIndicatorSection extends StatelessWidget {
  final String changeText;

  const _ChangeIndicatorSection({
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
          const SizedBox(width: 8.0),
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
