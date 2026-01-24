import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class ROIHeatmap extends StatelessWidget {
  const ROIHeatmap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ROI Heatmap", style: TextStyle(color: Colors.white, fontSize: 14.sp)),
          SizedBox(height: 15.h),

          // Heatmap Grid Placeholder (Simulating the 7x6 grid)
          AspectRatio(
            aspectRatio: 1.5,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, // Days: Mon to Sun
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemCount: 42, // Example cells
              itemBuilder: (context, index) {
                // Color logic based on intensity (Red to Green)
                Color cellColor = index % 5 == 0 ? Colors.redAccent :
                index % 3 == 0 ? Colors.orange : Colors.teal;
                return Container(
                  decoration: BoxDecoration(
                    color: cellColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                  child: Center(
                    child: Text("-0.07", style: TextStyle(color: Colors.white, fontSize: 6.sp)),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 10.h),
          // Legend Bar (Red to Green)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("-1.0%", style: TextStyle(color: Colors.white54, fontSize: 10.sp)),
              Expanded(
                child: Container(
                  height: 4.h,
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.r),
                    gradient: const LinearGradient(colors: [Colors.red, Colors.orange, Colors.teal]),
                  ),
                ),
              ),
              Text("+2.0%", style: TextStyle(color: Colors.white54, fontSize: 10.sp)),
            ],
          ),
        ],
      ),
    );
  }
}