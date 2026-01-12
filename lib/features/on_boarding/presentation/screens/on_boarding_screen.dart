import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart'; // GetX
import 'package:gary_goodger/share/widgets/custom_text/custom_text.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_icons/app_icons.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';

import '../../../auth/presentation/screens/auth_flow_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.to(() =>  AuthFlowScreen()); // Next screen
      });
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.h,
                child: SvgPicture.asset(
                  AppIcons.logo,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: AppText.empowerAnalyzeConnect,
                color: AppColors.subPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
