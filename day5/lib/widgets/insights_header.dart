import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class InsightsHeader extends StatelessWidget {
  final VoidCallback? onNotificationTap;
  final VoidCallback? onAddTap;

  const InsightsHeader({
    super.key,
    this.onNotificationTap,
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 28.0, right: 28.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 56.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Transform.scale(
                    scaleX: 1.0,
                    scaleY: 0.90,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hello, Alex!',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w800,
                        height: 0.9,
                        letterSpacing: -0.8,
                        color: const Color(0xFF111111),
                      ),
                    ),
                  ),
                ),
              ),
              _buildNotificationButton(),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 52.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Alex, your boards\nlooks so good!',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      height: 1.18,
                      letterSpacing: -0.2,
                      color: const Color(0xFF222222),
                    ),
                  ),
                ),
              ),
              _buildAddButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationButton() {
    return GestureDetector(
      onTap: onNotificationTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
              child: Container(
                width: 56.0,
                height: 56.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF74ADB9),
                  border: Border.all(
                    color: const Color(0x2EFFFFFF), // rgba(255,255,255,0.18)
                    width: 1.0,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/notification.svg',
                    width: 22.0,
                    height: 22.0,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 2.0,
            right: 2.0,
            child: Container(
              width: 8.0,
              height: 8.0,
              decoration: const BoxDecoration(
                color: Color(0xFFFF5A5A),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: onAddTap,
      child: Container(
        width: 52.0,
        height: 52.0,
        decoration: BoxDecoration(
          color: const Color(0xFFFDFDFD),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 18.0,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            LucideIcons.plus,
            size: 20.0,
            color: Color(0xFF2B2B2B),
          ),
        ),
      ),
    );
  }
}
