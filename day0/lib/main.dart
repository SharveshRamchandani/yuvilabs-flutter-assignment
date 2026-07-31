import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'theme/app_typography.dart';
import 'widgets/day0_card.dart';

void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Tracker - Day 0',
      home: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 32),
                const Day0Card(
                  title: 'Fitness & Calorie Tracker',
                  subtitle:
                      'Environment setup complete. Base design system & theme tokens initialized.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, Alex!',
          style: AppTypography.headerTitle,
        ),
        SizedBox(height: 4),
        Text(
          'Day 0 Setup & Base Foundation',
          style: AppTypography.subtitleText,
        ),
      ],
    );
  }
}