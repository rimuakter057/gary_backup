import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';

import 'dash_board_chart.dart';

class PerformanceCard extends StatelessWidget {
  const PerformanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.cardDark, // Dark contrast card
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Balance & Open Profit Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$175,320.58',
                      style: TextStyle(
                        fontSize: 22
                      )

                  ),
                  SizedBox(height: 4.h),
                  Text('+18%',
                      style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14.sp)),
                ],
              ),
              Text('\$256.36 open',
                  style: TextStyle(color: Colors.white60, fontSize: 12.sp)),
            ],
          ),
          SizedBox(height: 20.h),

          // Custom Tab Selector (Week, Month, Year)
          Container(
            height: 36.h,
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                _buildTab("Week", isSelected: true),
                _buildTab("Month"),
                _buildTab("Year"),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          // The Chart
          DashboardChart(),
        ],
      ),
    );
  }

  Widget _buildTab(String label, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white54,
            fontSize: 12.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}