import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';




class CustomTealSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomTealSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomTealSwitch> createState() => _CustomTealSwitchState();
}

class _CustomTealSwitchState extends State<CustomTealSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 64.w,
        height: 28.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),

          color: widget.value ?AppColors.primary: AppColors.greySwitch,
          border: Border.all(
            color: widget.value ?  AppColors.primary : AppColors.greySwitch,
            width: 2,
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Container(
              width: 39.w,
              height: 24.h,
              decoration:  BoxDecoration(
              borderRadius:  BorderRadius.circular(20.r),
                color: AppColors.white, // The white thumb
              ),
            ),
          ),
        ),
      ),
    );
  }
}