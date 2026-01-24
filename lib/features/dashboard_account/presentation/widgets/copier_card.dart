import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class CopierCard extends StatelessWidget {
  final String title, status, count;
  const CopierCard({super.key, required this.title, required this.status, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp)),
          SizedBox(height: 4.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(status, style: TextStyle(color: AppColors.primary, fontSize: 10.sp)),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(color: AppColors.accentOrange, shape: BoxShape.circle),
            child: Text(count, style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}