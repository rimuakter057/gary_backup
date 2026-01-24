import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class StatsCard extends StatelessWidget {
  final String title;
  final String mainValue;
  final List<Map<String, String>> details;

  const StatsCard({super.key, required this.title, required this.mainValue, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: AppColors.textGrey, fontSize: 12.sp)),
          Text(mainValue, style: TextStyle(color: AppColors.primary, fontSize: 18.sp, fontWeight: FontWeight.bold)),
          Divider(height: 20.h),
          ...details.map((item) => Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.keys.first, style: TextStyle(color: Colors.black54, fontSize: 11.sp)),
                Text(item.values.first, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11.sp)),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }
}