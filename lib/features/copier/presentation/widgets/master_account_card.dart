import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';

class MasterAccountCardAnalyzer extends StatelessWidget {
  final String title;
  final int enabled;
  final int disabled;

  const MasterAccountCardAnalyzer({
    super.key,
    required this.title,
    required this.enabled,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        borderColor: AppColors.boarderColor,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.bodyMedium,
                ),
                SizedBox(height: 4.h),
                Text(
                  "Slaves Enabled: $enabled  Disabled: $disabled",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodySmall.copyWith(fontWeight: FontWeight.w600,color: AppColors.textBlack)
                ),
              ],
            ),
          ),


          CustomContainer(
            width: 64.w,
     horizontal: 2.w, vertical: 2.h,
            radius: 50.r,
            backgroundColor: AppColors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(imageSrc: AppAssets.masterAccountShare),
                SizedBox(width: 4.w),
                Text(
                  "10",
                  style: context.titleSmall.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
