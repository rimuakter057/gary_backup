import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_divider/custom_divider.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';

class ComparePropScreen extends StatelessWidget {
  const ComparePropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          "Compare",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications_none_outlined, color: Colors.black),
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 15.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildToggleTabs(), // Prop Firms vs Broker
            SizedBox(height: 20.h),
            _buildCompareInputCard(context), // Selection Box
            SizedBox(height: 25.h),
            _buildLeaderboardHeader(context),

            ///leverage===================================================
            Text("leverage", textAlign: TextAlign.center),

            CustomContainer(
              //backgroundColor: AppColors.backgroundColor,
              backgroundColor: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppText.fx,
                    style: context.bodySmall.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            AppText.instant,
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "buy",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 24),
                      Column(
                        children: [
                          Text(
                            "1-Step",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\$${1333}",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 24),
                      Column(
                        children: [
                          Text(
                            "2-Step",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\$${1333}",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 24),
                      Column(
                        children: [
                          Text(
                            "3-Step",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\$${1333}",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            ///general===================================================
            Text("general", textAlign: TextAlign.center),

            CustomContainer(
              //backgroundColor: AppColors.backgroundColor,
              backgroundColor: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24, // Card width
                        height: 24, // Card height

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.white,
                          border: Border.all(color: AppColors.boarderColor),
                        ),
                      ),

                      SizedBox(width: 4.w),

                      Text(
                        AppText.country,
                        style: context.bodySmall.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "FoundingPips",
                        style: context.bodySmall.copyWith(
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        AppText.instant,
                        style: context.bodySmall.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CustomDivider(thickness: 1.2),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24.w, // Card width
                            height: 24.h, // Card height

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.white,
                              border: Border.all(color: AppColors.boarderColor),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "FoundingPips",
                            style: context.bodySmall.copyWith(
                              color: AppColors.textBlack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        AppText.instant,
                        style: context.bodySmall.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            _buildLeaderboardList(context), // List of firms
          ],
        ),
      ),
    );
  }

  Widget _buildCompareInputCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1424),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          CustomContainer(
            child: Column(
              children: [
                _dropdownField("FundingPips", context),
                CustomDivider(thickness: 1.1),
                _dropdownField("Select Prop Firm 2", context),
                Row(
                  children: [
                    CustomImage(imageSrc: AppAssets.addFirmCompare),
                    SizedBox(width: 4.w),
                    Text(AppText.addAnotherFirm, style: context.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          ElevatedButton(onPressed: () {}, child: const Text("Compare")),
        ],
      ),
    );
  }

  Widget _dropdownField(String hint, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: context.bodySmall.copyWith(
              color: AppColors.black,
              fontSize: 17,
            ),
          ),
          CustomImage(imageSrc: AppAssets.dropdown),
        ],
      ),
    );
  }

  Widget _buildLeaderboardList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => _firmTile(index + 1, context),
    );
  }

  Widget _firmTile(int rank, BuildContext context) {
    return CustomContainer(
      borderColor: AppColors.boarderColor,
      backgroundColor: AppColors.backgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 30.w, // Card width
                height: 30.h, // Card height

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.boarderColor),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Prop Firm Name", style: context.bodyMedium),
                  Text(
                    "AE • 2y • ★ 4.4",
                    style: context.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "#$rank",
                style: context.titleSmall.copyWith(color: AppColors.subPrimary),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              _metric("Max Allocation", "\$300,000", context),
              SizedBox(width: 36.w),
              Row(
                children: [
                  SizedBox(
                    height: 30.h,
                    child: VerticalDivider(color: AppColors.grey, thickness: 2),
                  ),
                  _metric("Leverage", "100x", context),
                ],
              ),
              SizedBox(width: 36.w),
              Row(
                children: [
                  SizedBox(
                    height: 30.h,
                    child: VerticalDivider(color: AppColors.grey, thickness: 2),
                  ),
                  _metric("Daily DD", "5%", context),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.infinity, 35.h),
              foregroundColor: AppColors.primary,
              side: BorderSide(
                color: AppColors.primary, // <-- Outline color
                width: 2, // Outline thickness
              ),
            ),

            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(imageSrc: AppAssets.pinnedCompare),
                SizedBox(width: 8.w),
                Text("Select to Compare"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _metric(String label, String value, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.bodySmall.copyWith(fontSize: 12)),
        Text(value, style: context.titleSmall.copyWith(fontSize: 14)),
      ],
    );
  }

  Widget _buildToggleTabs() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E4E7),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [_tabItem("Prop Firms", true), _tabItem("Broker", false)],
      ),
    );
  }

  Widget _tabItem(String title, bool active) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: active ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: active ? Colors.white : Colors.black54),
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboardHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Prop Firms Leaderboard", style: context.bodyMedium),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.greyShade,
            shape: BoxShape.circle,
          ),
          child: CustomImage(imageSrc: AppAssets.filter),
        ),
      ],
    );
  }
}
