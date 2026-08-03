import 'package:flutter/material.dart';
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
              child: Column(
                children: [
                  _buildDayLabel(_days[index]),
                  const SizedBox(height: 8),
                  _buildCapsule(
                    _days[index],
                    isSelected: isSelected,
                    dateText: isSelected ? '14' : null,
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Text(
      'Week Days',
      style: GoogleFonts.plusJakartaSans(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        color: const Color(0xFF111111),
      ),
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
      height: 140,
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
              bottom: 7,
              child: _buildSelectedBadge(dateText),
            ),
        ],
      ),
    );
  }

  Widget _buildTopIndicator({required bool isSelected}) {
    return Container(
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF111111) : const Color(0xFFE4E4E4),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildSelectedBadge(String text) {
    return Container(
      width: 35,
      height: 35,
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
