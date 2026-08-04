import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onItemTapped;

  const BottomNavigation({
    super.key,
    this.selectedIndex = 0,
    this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.navBackground,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _NavItem(
            assetPath: 'assets/icons/profile.svg',
            isSelected: selectedIndex == 0,
            onTap: () => onItemTapped?.call(0),
          ),
          const SizedBox(width: 6),
          _NavItem(
            assetPath: 'assets/icons/calendar.svg',
            isSelected: selectedIndex == 1,
            onTap: () => onItemTapped?.call(1),
          ),
          const SizedBox(width: 6),
          _NavItem(
            assetPath: 'assets/icons/scan.svg',
            isSelected: selectedIndex == 2,
            onTap: () => onItemTapped?.call(2),
          ),
        ],
      ),
    );   
  }
}

class _NavItem extends StatelessWidget {
  final String assetPath;
  final bool isSelected;
  final VoidCallback? onTap;

  const _NavItem({
    required this.assetPath,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? AppColors.navActiveIcon
        : AppColors.navInactiveIcon;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.navActiveBg : AppColors.navInactiveBg,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
