import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class TraderTile extends StatelessWidget {
  final int rank;
  final String name, followers, profit;
  final Color badgeColor;

  const TraderTile({super.key, required this.rank, required this.name, required this.followers, required this.profit, required this.badgeColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          // Rank Badge (Custom Shape)
          Container(
            width: 35.w, height: 35.w,
            decoration: BoxDecoration(color: badgeColor, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text("$rank", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
                Text("$followers Followers", style: TextStyle(color: AppColors.textGrey, fontSize: 11.sp)),
              ],
            ),
          ),
          Row(
            children: [
              Text(profit, style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textDark)),
              Icon(Icons.north_east, color: AppColors.primary, size: 14.sp),
            ],
          ),
        ],
      ),
    );
  }
}