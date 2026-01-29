import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/common/presentation/widgets/status_outline_container.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';


class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "2025-09-14",
                style: context.bodySmall.copyWith(fontSize: 12),
              ),
              Text("AED 79.00", style: context.bodyMedium),
            ],
          ),

          Row(
            children: [
              StatusOutlineContainer(
                statusBgColor: AppColors.primaryShade100,
                statusBorderColor: AppColors.primaryShade100,
                status: AppText.paid,
                statusTextColor: AppColors.primary,
              ),
              SizedBox(width: 12.w,),
              CustomContainer(
                vertical: 5,
                horizontal: 5,
                borderColor: AppColors.black,

                child: Row(
                  children: [
                    CustomImage(imageSrc: AppAssets.downloadProfile),
                    Text(
                      AppText.download,
                      style: context.bodyMedium.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}