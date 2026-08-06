import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_colors.dart';
import 'widgets/bottom_navigation.dart';
import 'widgets/breakfast_card.dart';
import 'widgets/calendar_screen.dart';
import 'widgets/current_weight_card.dart';
import 'widgets/progress_card.dart';
import 'widgets/todays_calories_card.dart';
import 'widgets/insights_header.dart';

void main() {
  runApp(const FitnessAppDay3());
}

class FitnessAppDay3 extends StatelessWidget {
  const FitnessAppDay3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Tracker - Day 4',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

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
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  SafeArea(child: _buildDashboardPage()),
                  CalendarScreen(
                    onBackTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                  ),
                  SafeArea(child: _buildScanPage()),
                ],
              ),
            ),

            if (_selectedIndex != 1)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BottomNavigation(
                    selectedIndex: _selectedIndex,
                    onItemTapped: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardPage() {
    return SingleChildScrollView(
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
                child: TodaysCaloriesCard(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const BreakfastCard(),
        ],
      ),
    );
  }

  Widget _buildScanPage() {
    return const Column(
      children: [
        InsightsHeader(),
      ],
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
