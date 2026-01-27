import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:google_fonts/google_fonts.dart';


class StatusOutlineContainer extends StatelessWidget {
  const StatusOutlineContainer({
    super.key,
    required this.statusBgColor,
    required this.statusBorderColor,
    required this.status,
    required this.statusTextColor,
  });

  final Color statusBgColor;
  final Color statusBorderColor;
  final String status;
  final Color statusTextColor;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        backgroundColor:statusBgColor,
        borderColor: statusBorderColor,
        radius: 6.r,
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        child: Text(status,style: GoogleFonts.instrumentSans(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: statusTextColor
        ),
        ));
  }
}