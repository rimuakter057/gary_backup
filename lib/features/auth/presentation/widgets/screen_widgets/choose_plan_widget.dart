import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/auth/controllers/onboarding_controller.dart';
import 'package:gary_goodger/features/auth/presentation/widgets/action_text_widget.dart';
import 'package:gary_goodger/features/auth/presentation/widgets/payment_option_row.dart';
import 'package:gary_goodger/share/widgets/custom_button/custom_button.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_divider/custom_divider.dart';
import 'package:gary_goodger/share/widgets/custom_text/custom_text.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:get/get.dart';
import '../onboarding_heading_widget.dart';

class ChoosePlanWidget extends StatelessWidget {
  ChoosePlanWidget({super.key});
  final OnBoardingController onBoardingController =
      Get.find<OnBoardingController>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(35.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///heading sections==================================
            OnboardingHeadingWidget(
              maxLine: 3,
              title: AppText.choosePlan,
              subTitle:
                  "Start your 14-day free trial. Your card will be charged automatically after the trial ends. Cancel anytime.",
            ),

            /// payment option===============================================================================
            PaymentOptionRow(),

            SizedBox(height: 16.h),

            /// custom container beginner===================================
            _buildBeginnerPopularContainer(
              level: 'Starter',
              levelBox: AppText.beginner,
              totalAmount: "\$219",
              monthAmount: "\$18.25/${AppText.month}",
              text:
                  "2 Copier Accounts (Master + Slave)\nTC Analyzer (Web + Mobile)\nSave up to 30% vs standalone\nAdd extra accounts for \$8/month each.",
            ),
            SizedBox(height: 24.h),

            /// custom container beginner===================================
            _buildBeginnerPopularContainer(
              borderColor: AppColors.primary,
              bgColor: Color(0xFFE0F2F1),
              boxColor: AppColors.primary,
              boxTextColor: AppColors.white,
              level: 'Pro',
              levelBox: AppText.popular,
              totalAmount: "\$399",
              monthAmount: "\$33.25/${AppText.month}",
              text:
                  "5 Copier Accounts\nTC Analyzer (included free after 6 months)\nPriority Support\nAdd extra accounts for \$6/month each.",
            ),

            SizedBox(height: 16.h),

            /// text section==============================================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ActionTextWidget(
                    prefixText: AppText.tradersConnect,
                    actionText: AppText.elite,
                    actionColor: AppColors.labelTextColor,
                    onActionTapped: () {},
                  ),
                ),
                _buildSmallContainer(title: AppText.bestValue),
              ],
            ),

            /// custom button================================================================
            CustomButton(
              onTap: () {
                onBoardingController.nextStepCreateAccount();
              },
              title: AppText.start14Day,
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }

  CustomContainer _buildBeginnerPopularContainer({
    required String level,
    required String levelBox,
    required String totalAmount,
    required String monthAmount,
    required String text,
    Color? boxTextColor, // default value
    Color? bgColor,
    Color? boxColor,
    Color? borderColor,
  }) {
    return CustomContainer(
      borderColor: borderColor ?? AppColors.white,
      backgroundColor: bgColor ?? AppColors.white,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// text section==============================================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ActionTextWidget(
                    prefixColor: AppColors.subTitle,
                    prefixText: AppText.tradersConnect,
                    actionColor: AppColors.subTitle,
                    actionText: level,
                    onActionTapped: () {},
                  ),
                ),
                _buildSmallContainer(
                  title: levelBox,
                  bgColorSm: boxColor ?? Color(0xFFF7F9FA),
                  textColor: boxTextColor ?? AppColors.labelTextColor,
                ),
              ],
            ),

            /// $ per year text section=================================================
            Row(
              children: [
                CustomText(
                  text: totalAmount,
                  color: AppColors.textBlack,
                  fontSize: 36.sp,
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: AppText.parYear),
                    CustomText(text: monthAmount, fontWeight: FontWeight.w700),
                  ],
                ),
              ],
            ),
            SizedBox(height: 4.h),
            CustomDivider(color: AppColors.dividerColor),
            SizedBox(height: 4.h),

            /// column text section==========================================
            CustomText(
              fontSize: 12.sp,
              color: AppColors.labelTextColor,
              text: text,
            ),

            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  ///small container section=============================================================
  CustomContainer _buildSmallContainer({
    required String title,
    Color? bgColorSm,
    Color? textColor,
  }) {
    return CustomContainer(
      backgroundColor: bgColorSm ?? Color(0xFFF7F9FA),
      padding: 8,
      child: CustomText(
        text: title,
        color: textColor ?? AppColors.labelTextColor,
        fontSize: 14.sp,
      ),
    );
  }
}
