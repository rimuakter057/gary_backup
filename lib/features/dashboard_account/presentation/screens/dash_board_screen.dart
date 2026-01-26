//
// import 'package:flutter/material.dart';
//
// class DashBoardScreen extends StatelessWidget {
//   const DashBoardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(child: Text("Home Screen"),),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/account_title.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/copier_card.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/insight_card.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/performance_card.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/trader_title.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text("Dashboard", style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
        leading: Icon(Icons.grid_view_rounded, color: AppColors.primary),
        actions: [
          Icon(Icons.notifications_none_outlined, color: Colors.black),
          SizedBox(width: 10.w),
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 15.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            _buildHeaderDropdown(),
            SizedBox(height: 15.h),
            PerformanceCard(),
            SizedBox(height: 20.h),
            _sectionHeader("Linked Accounts"),
            AccountTile(id: "MT5-104392", broker: "Exness", amount: "\$1,624", status: "Active",
              statusTextColor:  AppColors.primary,
              statusBgColor: AppColors.primaryShade100,
              statusBorderColor: AppColors.primary,
              // statusColor: AppColors.accentGreen
            ),
            AccountTile(id: "MT5-104392", broker: "IC Markets", amount: "\$1,624", status: "Pending",
              statusTextColor:  AppColors.primary,
              statusBgColor: AppColors.primaryShade100,
              statusBorderColor: AppColors.primary,
              //  statusColor: Colors.orange
            ),

            SizedBox(height: 15.h),
            _sectionHeader("Copiers Accounts"),
            // Horizontal scrollable list
            SizedBox(
              height: 130.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CopierCard(title: "Master Account 1", status: "Active", count: "10"),
                  CopierCard(title: "Master Account 2", status: "Active", count: "10"),
                  CopierCard(title: "Master Account 3", status: "Disabled", count: "2"),
                ],
              ),
            ),

            SizedBox(height: 20.h),
            _sectionHeader("Smart Insights"),
            InsightCard(),

            SizedBox(height: 20.h),
            _sectionHeader("Top Traders"),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.black),
              ),
              child: Column(
                children: [
                  TraderTile(rank: 1, name: "John FX", followers: "120", profit: "+12.5%", badgeColor: const Color(0xFFE5B05D)),
                  const Divider(),
                  TraderTile(rank: 2, name: "John FX", followers: "120", profit: "+9.8%", badgeColor: const Color(0xFFC0C0C0)),
                  const Divider(),
                  TraderTile(rank: 3, name: "John FX", followers: "120", profit: "+9.1%", badgeColor: const Color(0xFFCD7F32)),
                ],
              ),
            ),
            SizedBox(height: 30.h), // Bottom spacing
          ],
        ),
      ),
      bottomNavigationBar: _buildFloatingNavbar(),
    );
  }

  // Floating Navbar design
  Widget _buildFloatingNavbar() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, spreadRadius: 2)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home_filled, color: AppColors.primary, size: 24.sp),
          Icon(Icons.account_balance_wallet_outlined, color: AppColors.textGrey, size: 24.sp),
          Icon(Icons.speed, color: AppColors.textGrey, size: 24.sp),
          Icon(Icons.copy_all_outlined, color: AppColors.textGrey, size: 24.sp),
          Icon(Icons.insert_chart_outlined, color: AppColors.textGrey, size: 24.sp),
        ],
      ),
    );
  }

  Widget _buildHeaderDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          CircleAvatar(radius: 12.r, backgroundColor: AppColors.primary.withOpacity(0.1),
              child: Icon(Icons.account_balance_wallet, size: 14.sp, color: AppColors.primary)),
          SizedBox(width: 10.w),
          Text("MT5-104392", style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
          Icon(Icons.arrow_forward_ios, size: 14.sp, color: AppColors.textGrey),
        ],
      ),
    );
  }
}