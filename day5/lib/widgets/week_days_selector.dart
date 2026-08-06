import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekDaysSelector extends StatelessWidget {
  const WeekDaysSelector({super.key});

  static const List<String> _days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        _buildHeader(),
        const SizedBox(height: 20),
        Row(
          children: List.generate(_days.length, (index) {
            final isSelected = index == 2;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Column(
                  children: [
                    _buildDayLabel(_days[index]),
                    const SizedBox(height: 5),
                    _buildCapsule(
                      _days[index],
                      isSelected: isSelected,
                      dateText: isSelected ? '14' : null,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.translate(
          offset: const Offset(0, -4.0),
          child: Text(
            'Week Days',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
              color: const Color(0xFF111111),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 2.0),
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.6),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/calendar.svg',
                width: 22,
                height: 22,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF111111),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDayLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF222222),
      ),
    );
  }

  Widget _buildCapsule(
    String label, {
    required bool isSelected,
    String? dateText,
  }) {
    return Container(
      width: 40,
      height: 137,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 14,
            child: _buildTopIndicator(isSelected: isSelected),
          ),
          if (isSelected && dateText != null)
            Positioned(
              bottom: 1,
              child: _buildSelectedBadge(dateText),
            ),
        ],
      ),
    );
  }

  Widget _buildTopIndicator({required bool isSelected}) {
    final double size = isSelected ? 6.0 : 7.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF111111) : const Color(0xFFE5E5E5),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildSelectedBadge(String text) {
    return Container(
      width: 38,
      height: 38,
      decoration: const BoxDecoration(
        color: Color(0xFF071C20),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF6FD77A),
          ),
        ),
      ),
    );
  }
}
