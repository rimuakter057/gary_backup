import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/setting_bottom_sheet_widget.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';
import 'package:get/get.dart';
class AccountAppbarRowWidget extends StatelessWidget {
  const AccountAppbarRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppText.account,
              style: context.titleSmall.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),

            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              AppText.mt4104392,
              style: context.bodyMedium,
            ),
          ],
        ),
        Row(
          children: [
            CustomImage(imageSrc: AppAssets.dropdown),
            SizedBox(width: 12.w),
            GestureDetector(
              onTap: () {
                Get.bottomSheet(

                  SettingBottomSheetWidget(),


                  isScrollControlled: true,
                );
              },
              child: CustomImage(imageSrc: AppAssets.setting),
            ),
          ],
        ),
      ],
    );
  }
}