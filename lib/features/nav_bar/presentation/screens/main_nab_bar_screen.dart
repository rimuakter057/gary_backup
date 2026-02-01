import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/analyzer/presentation/screens/analyzer_screen.dart';
import 'package:gary_goodger/features/copier/presentation/screens/copier_screen.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/screens/account_screen.dart';
import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // Screen gulor list
  final List<Widget> _screens = [
    const AccountScreen(), // Index 0
    const CopierScreen(),    // Index 1
    const AnalyzerScreen(),  // Index 2
    const Center(child: Text("Wallet Screen")), // Placeholder Index 3
    const Center(child: Text("Profile Screen")), // Placeholder Index 4
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // IndexedStack use korle screen switching er somoy state thik thake
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildFloatingNavbar(),
    );
  }

  Widget _buildFloatingNavbar() {
    return Container(
      margin: EdgeInsets.only(
          left: ResponsiveHelper.width(20),
          right: ResponsiveHelper.width(20),
          bottom: ResponsiveHelper.height(24),
      ),
      padding: ResponsiveHelper.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(30),),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navIcon(Icons.home_filled, 0),
          _navIcon(Icons.account_balance_wallet_outlined, 1),
          _navIcon(Icons.speed, 2), // Analyzer Icon
          _navIcon(Icons.copy_all_outlined, 3),
          _navIcon(Icons.insert_chart_outlined, 4),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: ResponsiveHelper.all(8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? AppColors.primary : AppColors.textGrey,
          size: ResponsiveHelper.fontSize(24),
        ),
      ),
    );
  }
}