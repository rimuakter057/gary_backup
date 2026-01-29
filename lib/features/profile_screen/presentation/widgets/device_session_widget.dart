
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/common/presentation/widgets/status_outline_container.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';

class DeviceSessionWidget extends StatelessWidget {
  const DeviceSessionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.greyShade,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Primary - Exness",
                style: context.titleSmall.copyWith(color: AppColors.textBlack),
              ),
              Text("MT5-104392", style: context.bodySmall),
            ],
          ),
          SizedBox(height: 16.h),
          StatusOutlineContainer(
              verticalPadding: 8,
              horizontalPadding: 8,
              statusBgColor: AppColors.red,
              statusBorderColor: AppColors.red,
              status: "Terminate",
              statusTextColor: AppColors.white
          )
        ],
      ),
    );
  }
}
