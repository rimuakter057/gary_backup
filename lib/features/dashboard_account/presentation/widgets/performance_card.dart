import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';

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
                      style: context.bodyLarge.copyWith(color: AppColors.white)

                  ),
                  SizedBox(height: 4.h),
                  Text('+18%',
                      style: context.titleMedium.copyWith(color: AppColors.primaryShade)
                  ),
                ],
              ),
              Row(
                children: [
                  Text('\$256.36',
                      style: context.titleMedium.copyWith(color: AppColors.white)
                  ),
                  Text('  open',
                      style: context.titleMedium.copyWith(color: AppColors.subPrimary)
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),





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