import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class InsightCard extends StatelessWidget {
  const InsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(AppAssets.logo),
          opacity: 0.1,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Best ROI Window", style: TextStyle(color: Colors.white, fontSize: 12.sp)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  children: [
                    Icon(Icons.flash_on, color: Colors.white, size: 12.sp),
                    Text(" High", style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text("Trade Between 03:00 - 11:00 UTC",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.sp)),
          SizedBox(height: 6.h),
          Text("Historical data shows +1.3% average ROI during this window. Favor high-liquidity instruments.",
              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 11.sp)),
        ],
      ),
    );
  }
}