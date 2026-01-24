import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/master_account_card.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';

class CopierScreen extends StatelessWidget {
  const CopierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Icon(Icons.grid_view_rounded, color: AppColors.primary),
        title: Text(
          "Copier",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.black),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Column(
        children: [
          // Top Tabs (Accounts, Templates, Logs)
          _buildTopTabs(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  _buildSearchBar(),
                  SizedBox(height: 20.h),

                  Text(
                    "Master Accounts",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  // Sections
                  _buildSectionHeader("Enabled (03)"),
                  const MasterAccountCard(
                    title: "Master Account 1",
                    enabled: 7,
                    disabled: 3,
                  ),
                  const MasterAccountCard(
                    title: "Master Account 2",
                    enabled: 7,
                    disabled: 3,
                  ),
                  const MasterAccountCard(
                    title: "Master Account 3",
                    enabled: 7,
                    disabled: 3,
                  ),

                  SizedBox(height: 15.h),
                  _buildSectionHeader("Disabled - Monitor Existing (03)"),
                  const MasterAccountCard(
                    title: "Master Account 4",
                    enabled: 7,
                    disabled: 3,
                  ),
                  const MasterAccountCard(
                    title: "Master Account 5",
                    enabled: 7,
                    disabled: 3,
                  ),

                  SizedBox(height: 15.h),
                  _buildSectionHeader("Disabled (03)"),
                  const MasterAccountCard(
                    title: "Master Account 7",
                    enabled: 7,
                    disabled: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopTabs() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Color(0xFFE0E4E7),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          _tabItem("Accounts", isSelected: true),
          _tabItem("Templates"),
          _tabItem("Logs"),
        ],
      ),
    );
  }

  Widget _tabItem(String title, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search, size: 20.sp),
        suffixIcon: Icon(Icons.mic, size: 20.sp),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
      ),
    );
  }
}
