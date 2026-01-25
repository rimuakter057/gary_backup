import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/auth/presentation/widgets/bottom_sheet_create_account.dart';
import 'package:gary_goodger/features/auth/controllers/onboarding_controller.dart';
import 'package:gary_goodger/features/auth/presentation/widgets/bottom_sheet_login.dart';
import 'package:gary_goodger/share/widgets/custom_button/custom_button.dart';
import 'package:gary_goodger/share/widgets/custom_svg_icon/custom_svg_icon.dart';
import 'package:gary_goodger/share/widgets/custom_text_button/custom_text_button.dart';
import 'package:gary_goodger/utils/app_assets/app_icons.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';

import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthFlowScreen extends StatelessWidget {
  AuthFlowScreen({super.key});
  final OnBoardingController onBoardingController =
      Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.onBoardingGradient),
        child: Stack(
          children: [
            ///  CENTER TEXT (100% screen center)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///  logo onboarding  text===================================================
                  CustomSvgIcon(
                    icon: AppAssets.logoOnboarding,
                    width: 192.w,
                    height: 22.h,
                  ),

                  SizedBox(height: 16.h),

                  ///=============================  Rich Text============================
                  /// compete smarter text=========================================
                  Text.rich(
                    TextSpan(
                      children: [
                        _buildTextSpan(
                          title: AppText.compete,
                          textColor: AppColors.white,
                        ),
                        _buildTextSpan(
                          title: AppText.smarter,
                          textColor: AppColors.yellowOnBoardingText,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  /// trade better text=========================================
                  Text.rich(
                    TextSpan(
                      children: [
                        _buildTextSpan(
                          title: AppText.trade,
                          textColor: AppColors.white,
                        ),
                        _buildTextSpan(
                          title: AppText.better,
                          textColor: AppColors.yellowOnBoardingText,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 24.h),

                  /// doted indicator ============================================
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onBoardingController.totalIndicators,
                        (index) {
                          final isActive =
                              onBoardingController.activeIndex.value == index;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            height: 8.h,
                            width: isActive ? 24.w : 8.w,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? AppColors.white
                                  : AppColors.dotedGrey,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),

            ///login and create account others section==========================
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: 0.35,
                widthFactor: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// outline log in button===================================================
                      OutlinedButton(
                        onPressed: () {
                          onBoardingController.resetFlowLogin();
                          Get.bottomSheet(
                            AuthFlowBottomSheetLogIn(),
                            isScrollControlled: true,
                          );
                        },
                        child: Text(AppText.login),
                      ),

                      SizedBox(height: 20.h),

                      ///create account button==================================================
                      ElevatedButton(
                        onPressed: () {
                          onBoardingController.resetFlowCreateAccount();
                          Get.bottomSheet(
                            AuthFlowBottomSheetCreateAccount(),
                            isScrollControlled: true,
                          );
                        },
                        child: Text(AppText.createAccount),
                      ),

                      SizedBox(height: 18.h),

                      ///text section==============================================
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.instrumentSans(
                              color: AppColors.black,
                              fontSize: 14.sp,
                            ),
                            children: [
                              const TextSpan(text: AppText.byContinuing),

                              ///privacy policy===================================================
                              _buildTextSpanTermsPrivacy(
                                title: AppText.privacyPolicy,
                                onTap: () {},
                              ),
                              const TextSpan(text: AppText.and),

                              /// terms condition=======================================================
                              _buildTextSpanTermsPrivacy(
                                title: AppText.termsOfUse,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// build text span privacy terms ==============================
  TextSpan _buildTextSpanTermsPrivacy({
    required String title,
    required VoidCallback onTap,
  }) {
    return TextSpan(
      text: title,
      style: GoogleFonts.instrumentSans(
        color: AppColors.textBlack,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.subPrimary,
        decorationThickness: 2,
        fontWeight: FontWeight.bold,
      ),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  }

  /// build text span on boarding title ==============================
  TextSpan _buildTextSpan({required String title, required Color textColor}) {
    return TextSpan(
      text: title,
      style: GoogleFonts.instrumentSans(
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }
}
