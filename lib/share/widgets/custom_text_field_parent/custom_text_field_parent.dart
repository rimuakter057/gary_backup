import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class CustomTextFieldParent extends StatelessWidget {
  const CustomTextFieldParent({
    super.key, required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        padding: 0,
        radius: 8.r,
        borderColor: AppColors.boarderTextField,
        width: double.infinity,

        child: child
    );
  }
}