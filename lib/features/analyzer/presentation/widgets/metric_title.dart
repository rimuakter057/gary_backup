import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class MetricTile extends StatelessWidget {
  final String label, value, status;
  final Color statusColor;

  const MetricTile({super.key, required this.label, required this.value, required this.status, required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(color: AppColors.textGrey, fontSize: 12.sp)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(4.r)),
                child: Text(status, style: TextStyle(color: statusColor, fontSize: 10.sp, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(value, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}