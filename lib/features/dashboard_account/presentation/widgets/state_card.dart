import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';




class StatCard extends StatelessWidget {
  final String title;
  final String amount;
  final String percent;

  const StatCard({
    super.key,
    required this.title,
    required this.amount,
    required this.percent, // only number: "2.1"
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.all(8),
      width: 100.w,
      margin: EdgeInsets.only(right: 12.w),
      borderColor: AppColors.boarderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImage(imageSrc: AppAssets.insightsDashboard),
          SizedBox(height: 24.h),

          Text(title, style: context.bodySmall),

          Text("\$$amount", style: context.bodyMedium),

          Row(
            children: [
              Text(
                "+$percent%", // ← fixed + %
                style: context.bodySmall.copyWith(color: AppColors.primary),
              ),
              CustomImage(imageSrc: AppAssets.topArrow),
            ],
          ),
        ],
      ),
    );
  }
}