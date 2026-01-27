
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';
class HighInsightsContainerWidget extends StatelessWidget {
  const HighInsightsContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      backgroundColor: AppColors.primary,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppText.bestRoiWindow,
                style: context.titleSmall.copyWith(color: AppColors.white),
              ),
              CustomContainer(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                backgroundColor: AppColors.black,
                child: Row(
                  children: [
                    CustomImage(imageSrc: AppAssets.highDashBoardDashboard),
                    Text(
                      AppText.high,
                      style: context.bodySmall.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            "Trade Between 03:00 - 11:00 UTC",
            style: context.bodySmall.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            "Historical data shows +1.3% average ROI during this window. Favor high-liquidity instruments.",
            style: context.bodySmall.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 16.h),
          Row(
            children: List.generate(
              3,
                  (index) => Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Container(
                  height: 5,
                  width: 5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}