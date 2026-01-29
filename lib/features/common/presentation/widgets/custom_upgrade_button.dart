import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';


class CustomUpgradeButton extends StatelessWidget {
  const CustomUpgradeButton({
    super.key, this.onTap,
  });

  final VoidCallback?onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  CustomContainer(
    horizontal: 6.w,
        vertical: 4.h,
        backgroundColor: AppColors.primary,
        child: Row(children: [

          CustomImage(imageSrc: AppAssets.upgrade),
          Text(AppText.upgrade,style: context.bodySmall.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600
          ),),

        ],),),
    );
  }
}