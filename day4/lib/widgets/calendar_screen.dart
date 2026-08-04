import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import 'calorie_count_bar.dart';
import 'calorie_left_card.dart';
import 'food_item_card.dart';
import 'week_days_selector.dart';

class CalendarScreen extends StatelessWidget {
  final VoidCallback? onBackTap;

  const CalendarScreen({
    super.key,
    this.onBackTap,
  });

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: _buildTopNavigation(context),
              ),
              const SizedBox(height: 24),
              const Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WeekDaysSelector(),
                      SizedBox(height: 28),
                      CalorieLeftCard(),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: FoodItemCard(
                              title: 'Taco',
                              calories: 526,
                              carbs: '85g',
                              backgroundColor: AppColors.foodTacoBg,
                              caloriesAccent: AppColors.foodTacoCalories,
                              carbsAccent: AppColors.foodTacoCarbs,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: FoodItemCard(
                              title: 'Donut',
                              calories: 856,
                              carbs: '45g',
                              backgroundColor: AppColors.foodDonutBg,
                              caloriesAccent: AppColors.foodDonutCalories,
                              carbsAccent: AppColors.foodDonutCarbs,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      CalorieCountBar(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildBackButton(context),
        _buildNotificationButton(),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onBackTap != null) {
          onBackTap!();
        } else if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF74ADB9),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/back_arrow.svg',
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationButton() {
    return GestureDetector(
      onTap: () {
        if (onBackTap != null) {
          onBackTap!();
        }
      },
      child: Stack(
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
                height: 24,
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
      ),
    );
  }
}
