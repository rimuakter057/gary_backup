import 'package:flutter/material.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key, this.color,
  });
final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,  // full screen width
      child: Divider(
        color:color??AppColors.boarderColor,
        thickness: 1,
      ),
    );
  }
}