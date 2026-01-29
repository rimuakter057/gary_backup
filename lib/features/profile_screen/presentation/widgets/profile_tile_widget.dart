import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart' show CustomImage;
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';


class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomImage(imageSrc: AppAssets.securityProfile),
            SizedBox(width: 12.w,),
            Text("Security",style: context.bodyMedium.copyWith(fontWeight: FontWeight.w500),),
          ],
        ),

        CustomImage(imageSrc: AppAssets.arrowFront),

      ],);
  }
}