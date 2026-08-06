import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import '../theme/app_colors.dart';

class CalorieCountBar extends StatelessWidget {
  final VoidCallback? onTap;

  const CalorieCountBar({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 66.0,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(6.0, 6.0, 16.0, 6.0),
        decoration: BoxDecoration(
          color: AppColors.ctaBackground,
          borderRadius: BorderRadius.circular(33.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLeftCircle(),
            const Spacer(),
            _buildCenterText(),
            const SizedBox(width: 8.0),
            _buildChevrons(),
            const Spacer(),
            _buildRightButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftCircle() {
    return SizedBox(
      width: 54.0,
      height: 54.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 54.0,
            height: 54.0,
            decoration: const BoxDecoration(
              color: Color(0xFF59E16D),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 24.0,
            height: 24.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const Icon(
            Icons.check,
            size: 15.0,
            color: Color(0xFF59E16D),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterText() {
    return Text(
      'Calorie count',
      style: GoogleFonts.plusJakartaSans(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF5FD86E),
        letterSpacing: -0.4,
      ),
    );
  }

  Widget _buildChevrons() {
    const chevronColor = Color(0xFF5FD86E);
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          LucideIcons.chevronRight,
          size: 15.0,
          color: chevronColor,
        ),
        SizedBox(width: 4.0),
        Icon(
          LucideIcons.chevronRight,
          size: 15.0,
          color: chevronColor,
        ),
        SizedBox(width: 4.0),
        Icon(
          LucideIcons.chevronRight,
          size: 15.0,
          color: chevronColor,
        ),
      ],
    );
  }

  Widget _buildRightButton() {
    return Container(
      width: 42.0,
      height: 42.0,
      decoration: const BoxDecoration(
        color: Color(0xFF0F3229),
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Icons.check,
          size: 14.0,
          color: Color(0xFF5FD86E),
        ),
      ),
    );
  }
}
