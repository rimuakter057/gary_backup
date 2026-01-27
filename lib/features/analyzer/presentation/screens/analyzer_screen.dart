import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/analyzer/presentation/widgets/portfolio_gauge.dart';
import 'package:gary_goodger/features/analyzer/presentation/widgets/status_card.dart';
import 'package:gary_goodger/features/common/presentation/widgets/high_insights_container.dart';
import 'package:gary_goodger/features/common/presentation/widgets/status_outline_container.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';

class AnalyzerScreen extends StatelessWidget {
  const AnalyzerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Icon(Icons.grid_view_rounded, color: AppColors.primary),
        title: Text(
          "Analyzer",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(Icons.notifications_none_outlined, color: Colors.black),
          Icon(Icons.filter_list, color: Colors.black),
          SizedBox(width: 10.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildDropdownHeader(),
            SizedBox(height: 15.h),
            _buildTabSelector(),
            SizedBox(height: 20.h),
            PortfolioGauge(),
            SizedBox(height: 20.h),

            ///static card===================================================
            Text("statics", textAlign: TextAlign.center),
            StatisticsAnalyzerCard(
              title: "Total PNL",
              mainValue: "\$12,437",
              details: [
                {"Fees/Swaps": "-\$312"},
                {"Commissions": "-\$198"},
                {"Best day": "+\$1,700"},
              ],
            ),

            ///high insights card===================================================
            Text("high card", textAlign: TextAlign.center),
            HighInsightsContainerWidget(),

            ///key matrics card===================================================
            Text("key matrics", textAlign: TextAlign.center),
            CustomContainer(
              //backgroundColor: AppColors.backgroundColor,
              backgroundColor: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("title", style: context.bodySmall),
                      StatusOutlineContainer(
                        statusBgColor: AppColors.primaryShade100,
                        statusBorderColor: AppColors.primary,
                        status: AppText.healthy,
                        statusTextColor: AppColors.primary,
                      ),
                    ],
                  ),
                  Text("1.78", style: context.bodyMedium),
                  SizedBox(height: 16.h),

                  Row(
                    children: [
                      _buildRow(context, title: "title", mainValue: "2363"),
                      SizedBox(width: 8),
                      Text("/", style: context.bodySmall),
                      SizedBox(width: 8),
                      _buildRow(context, title: "title", mainValue: "23"),
                    ],
                  ),
                ],
              ),
            ),

            ///heatmap traders card===================================================
            Text("heta map", textAlign: TextAlign.center),

            CustomContainer(
              //backgroundColor: AppColors.backgroundColor,
              backgroundColor: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppText.xauUsd,
                        style: context.bodySmall.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "2025-10-11",
                        style: context.bodySmall.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(AppText.side, style: context.bodySmall),
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
                          Text(AppText.entry, style: context.bodySmall),
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
                          Text(AppText.exit, style: context.bodySmall),
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
                          Text(AppText.pl, style: context.bodySmall),
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
/// AI Insights Trail======================================================================


            Text("AI Insights Trail", textAlign: TextAlign.center),
            CustomContainer(
              backgroundColor: AppColors.primaryShade100,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 4,
                        ),
                        backgroundColor: AppColors.primaryShade100,
                        borderColor: AppColors.primary,
                        child: Row(
                          children: [
                            CustomImage(imageSrc: AppAssets.insightsAnalyzer),
                            Text(
                              AppText.strong,
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          CustomImage(imageSrc: AppAssets.clock),
                          SizedBox(width: 4.w),
                          Text("2 min ago", style: context.bodySmall),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    "Risk — Wed 18-21 UTC Drawdown Cluster",
                    style: context.bodyMedium,
                  ),
                  SizedBox(height: 8,),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                   "DD risk +23% vs baseline; losing streaks originate here.",
                    style: context.bodySmall,
                  ),
                  SizedBox(height: 8,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(

                        "Tip: ",
                        style: context.bodySmall.copyWith(fontWeight: FontWeight.w700),
                      ),

                      Expanded(
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          "Avoid entries after 18:00 UTC on Fridays for NAS100",
                          style: context.bodySmall,
                        ),
                      ),
                    ],
                  ),



                ],
              ),
            ),

            SizedBox(height: 38),
          ],
        ),
      ),
    );
  }

  // Same dropdown logic as Dashboard
  Widget _buildDropdownHeader() {
    /* code from previous response */
    return Container();
  }

  Widget _buildTabSelector() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Color(0xFFE0E4E7),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Text(
                  "Performance",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(child: Center(child: Text("Analysis Hub"))),
        ],
      ),
    );
  }

  Row _buildRow(
    BuildContext context, {
    required String title,
    required mainValue,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: context.bodySmall.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(width: 4.w),
        Text(
          "\$$mainValue",
          style: context.bodySmall.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
