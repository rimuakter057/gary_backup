import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class TradeLogTile extends StatelessWidget {
  const TradeLogTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.black),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("XAUUSD", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
              Text("2025-10-11", style: TextStyle(color: AppColors.textGrey, fontSize: 10.sp)),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoItem("Side", "Buy", Colors.black),
              _infoItem("Entry", "1928.4", Colors.black),
              _infoItem("Exit", "1923.1", Colors.black),
              _infoItem("P/L", "+\$162.00", AppColors.primary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: AppColors.textGrey, fontSize: 10.sp)),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp, color: valueColor)),
      ],
    );
  }
}