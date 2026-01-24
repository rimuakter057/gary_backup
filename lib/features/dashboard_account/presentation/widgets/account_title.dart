import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class AccountTile extends StatelessWidget {
  final String id, broker, amount, status;
  final Color statusColor;

  const AccountTile({super.key,
    required this.id, required this.broker,
    required this.amount, required this.status, required this.statusColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.black),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(id, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(status, style: TextStyle(color: statusColor, fontSize: 10.sp, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Text(broker, style: TextStyle(color: AppColors.textGrey, fontSize: 12.sp)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
              Text("+0.1%", style: TextStyle(color: AppColors.accentGreen, fontSize: 11.sp)),
            ],
          )
        ],
      ),
    );
  }
}