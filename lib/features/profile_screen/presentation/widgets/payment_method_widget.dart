import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';


class PaymentMethodeWidget extends StatelessWidget {
  const PaymentMethodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerBorderParent(
      vertical: 15.h,
      horizontal: 15.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Visa ending in 1234",
                  style: context.titleSmall.copyWith(
                      fontSize: 15
                  )
              ),
              Text("Expiry 06/2027", style: context.bodySmall),
            ],
          ),

          Row(
            children: [
              CustomImage(imageSrc: AppAssets.checkProfile,height: 24,width: 24,),
              SizedBox(width: 12.w,),
              CustomImage(imageSrc: AppAssets.deleteProfile),


            ],
          ),
        ],
      ),
    );
  }
}