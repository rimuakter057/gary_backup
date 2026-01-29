import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/common/presentation/widgets/status_outline_container.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationBoxWidget extends StatelessWidget {
  const NotificationBoxWidget({
    super.key,
    required this.gap,
  });

  final Widget gap;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderColor: AppColors.notificationBorder,
      backgroundColor: AppColors.notificationBg,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reuters - 12 minutes ago",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlack,
                ),
              ),
              gap,
              Text(
                "Dollar eases as traders eye FOMC minutes; focus on inflation path",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                ),
              ),

              gap,

              Row(
                children: [
                  StatusOutlineContainer(
                    statusBgColor: AppColors.primaryShade100,
                    statusBorderColor: AppColors.black,
                    status: "RISK",
                    statusTextColor: AppColors.primary,

                    fontSize: 10,
                  ),
                  SizedBox(width: 8.w),
                  StatusOutlineContainer(
                    statusBgColor: AppColors.redAccent,
                    statusBorderColor: AppColors.red,
                    status: "HIGH",
                    statusTextColor: AppColors.red,

                    fontSize: 10,
                  ),
                ],
              ),

              gap,

              Text(
                "USD slips ahead of minutes; market expects softer tone on inflation risks.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlack,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}