import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_colors.dart';
import 'widgets/bottom_navigation.dart';
import 'widgets/current_weight_card.dart';
import 'widgets/progress_card.dart';

void main() {
  runApp(const FitnessAppDay1());
}

class FitnessAppDay1 extends StatelessWidget {
  const FitnessAppDay1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Tracker - Day 1',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.backgroundTop, AppColors.backgroundBottom],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              // Main Scrollable Content
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 24),
                      const ProgressCard(),
                      const SizedBox(height: 20),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CurrentWeightCard(),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Floating Bottom Navigation Bar
              const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: BottomNavigation(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scaleX: 1.0,
          scaleY: 0.92,
          alignment: Alignment.centerLeft,
          child: Text(
            'Hello, Alex!',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              height: 0.9,
              textStyle: const TextStyle(
                leadingDistribution: TextLeadingDistribution.even,
              ),
              letterSpacing: -0.8,
              color: const Color(0xFF111111),
            ),
          ),
        ),
        _buildNotificationButton(),
      ],
    );
  }

  Widget _buildNotificationButton() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF74ADB9),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/notification.svg',
              width: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        Positioned(
          top: 1,
          right: 1,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: const Color(0xFFFF5E57),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF9CD1E3),
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
