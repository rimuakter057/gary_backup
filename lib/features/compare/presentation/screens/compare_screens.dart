import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class ComparePropScreen extends StatelessWidget {
  const ComparePropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text("Compare", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.sp)),
        centerTitle: true,
        actions: [Icon(Icons.notifications_none_outlined, color: Colors.black), Icon(Icons.menu, color: Colors.black), SizedBox(width: 15.w)],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildToggleTabs(), // Prop Firms vs Broker
            SizedBox(height: 20.h),
            _buildCompareInputCard(), // Selection Box
            SizedBox(height: 25.h),
            _buildLeaderboardHeader(),
            _buildLeaderboardList(), // List of firms
          ],
        ),
      ),
    );
  }

  Widget _buildCompareInputCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(color: const Color(0xFF0D1424), borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        children: [
          _dropdownField("FundingPips"),
          SizedBox(height: 10.h),
          _dropdownField("Select Prop Firm 2"),
          SizedBox(height: 15.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: Size(double.infinity, 45.h),
            //  shape: RoundedRectangleAt(borderRadius: BorderRadius.circular(10.r)),
            ),
            onPressed: () {},
            child: const Text("Compare", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _dropdownField(String hint) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(hint), const Icon(Icons.keyboard_arrow_down)],
      ),
    );
  }

  Widget _buildLeaderboardList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => _firmTile(index + 1),
    );
  }

  Widget _firmTile(int rank) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        children: [
          Row(
            children: [
              Container(width: 40.w, height: 40.w, color: Colors.grey[200]),
              SizedBox(width: 12.w),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Prop Firm Name", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("AE • 2y • ★ 4.4", style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
              ]),
              const Spacer(),
              Text("#$rank", style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _metric("Max Allocation", "\$300,000"),
              _metric("Leverage", "100x"),
              _metric("Daily DD", "5%"),
            ],
          ),
          SizedBox(height: 12.h),
          OutlinedButton(
            style: OutlinedButton.styleFrom(minimumSize: Size(double.infinity, 35.h)),
            onPressed: () {},
            child: const Text("Select to Compare"),
          ),
        ],
      ),
    );
  }

  Widget _metric(String label, String value) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: TextStyle(fontSize: 9.sp, color: Colors.grey)),
      Text(value, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
    ]);
  }

  Widget _buildToggleTabs() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(color: const Color(0xFFE0E4E7), borderRadius: BorderRadius.circular(10.r)),
      child: Row(children: [
        _tabItem("Prop Firms", true),
        _tabItem("Broker", false),
      ]),
    );
  }

  Widget _tabItem(String title, bool active) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(color: active ? AppColors.primary : Colors.transparent, borderRadius: BorderRadius.circular(8.r)),
        child: Center(child: Text(title, style: TextStyle(color: active ? Colors.white : Colors.black54))),
      ),
    );
  }

  Widget _buildLeaderboardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Prop Firms Leaderboard", style: TextStyle(fontWeight: FontWeight.bold)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
      ],
    );
  }
}