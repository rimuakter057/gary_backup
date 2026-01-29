import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/common/presentation/widgets/status_outline_container.dart';
import 'package:gary_goodger/features/sentiments/presentation/widgets/market_news_widget.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class SentimentsScreen extends StatelessWidget {
  const SentimentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB), // Light background
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildToggleTabs(), // All Instruments / Watchlist
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  SizedBox(height: 15.h),
                  _buildCategoryChips(), // All, Forex, Indices etc.
                  SizedBox(height: 20.h),

                  _sectionTitle("Extreme Watchlist"),
                  ///sentiment card=======================================
                  _sentimentCard(
                    pair: "XAUUSD",
                    cat: "Forex",
                    buy: 6,
                    sell: 68,
                    risk: "HIGH",
                    change: "+6% vs 24h",
                    context: context,
                  ),

                SizedBox(height: 20.h),
                ///market news card=========================================================================
                MarketNewsWidget(),




                  CustomContainer(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Reuters - 12 minutes ago",
                                style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color:AppColors.textBlack
                                )
                            ),
                            SizedBox(height: 8.h),
                            Text("Dollar eases as traders eye FOMC minutes; focus on inflation path",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color:AppColors.textBlack
                                )
                            ),

                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                StatusOutlineContainer(


                                  statusBgColor: AppColors.orangeShadeBg,
                                  statusBorderColor: AppColors.orange,
                                  status: AppText.mediumCapital,
                                  statusTextColor: AppColors.orange,

                                  fontSize: 10,
                                ),
                                SizedBox(),
                              ],
                            ),

                            SizedBox(height: 8.h),

                            Text("USD slips ahead of minutes; market expects softer tone on inflation risks.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color:AppColors.textBlack
                                )
                            ),


                          ],
                        ),
                        SizedBox(height: 15.h),

                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            Expanded(
                              child: StatusOutlineContainer(
                                statusBgColor: AppColors.white,
                                statusBorderColor: AppColors.boarderColor,
                                status: "Save",
                                statusTextColor: AppColors.subPrimary,
                                verticalPadding: 8,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: StatusOutlineContainer(
                                statusBgColor: AppColors.primary,
                                statusBorderColor: AppColors.primary,
                                status: "Read",
                                statusTextColor: AppColors.white,
                                verticalPadding: 8,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 100.h), // Bottom navigation space
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sentimentCard({
    required String pair,
    required String cat,
    required String change,
    required int buy,
    required int sell,
    required String risk,
    required BuildContext context,
  }) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pair, style: context.bodyMedium),
                  Text(
                    "$cat • $change",
                    style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                  ),
                ],
              ),
              _riskBadge(risk),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Text("34%", style: context.bodySmall),
              SizedBox(width: 4.w),
              Expanded(
                child: CustomContainer(
                  horizontal: 2,
                  vertical: 2,
                  backgroundColor: AppColors.greyShade,
                  child: _sentimentBar(),
                ),
              ),
              SizedBox(width: 4.w),
              Text("32%", style: context.bodySmall),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(
                child: StatusOutlineContainer(
                  statusBgColor: AppColors.white,
                  statusBorderColor: AppColors.boarderColor,
                  status: AppText.analyze,
                  statusTextColor: AppColors.subPrimary,
                  verticalPadding: 8,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: StatusOutlineContainer(
                  statusBgColor: AppColors.primary,
                  statusBorderColor: AppColors.primary,
                  status: AppText.details,
                  statusTextColor: AppColors.white,
                  verticalPadding: 8,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Buy/Sell Sentiment Bar (Red & Green Dashed style)
  Widget _sentimentBar() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: List.generate(20, (index) {
                // Splits the 20 segments based on buy percentage
                //   bool isBuy = index < (buy / 5);
                return Expanded(
                  child: Container(
                    height: 4.h,
                    margin: EdgeInsets.symmetric(horizontal: 1.w),

                    decoration: BoxDecoration(
                      // color: isBuy ? Colors.redAccent : Colors.greenAccent,
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _riskBadge(String label) {
    Color color;

    switch (label) {
      case "HIGH":
        color =AppColors.primary;
        break;
      case "LOW":
        color =AppColors.red;
        break;
      case "MEDIUM":
        color =AppColors.orange;
        break;
      default:
        color =AppColors.red;
    }

    return StatusOutlineContainer(
      statusBgColor: AppColors.primaryShade100,
      statusBorderColor: AppColors.primary,
      status: label,
      statusTextColor: color,
    );
  }

  Widget _actionButton(String label, {required bool isOutlined}) {
    return Container(
      height: 35.h,
      decoration: BoxDecoration(
        color: isOutlined ? Colors.transparent : const Color(0xFF00A693),
        borderRadius: BorderRadius.circular(8.r),
        border: isOutlined ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isOutlined ? Colors.black : Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Common Header/UI Elements
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Sentiments",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(Icons.grid_view_rounded, color: const Color(0xFF00A693)),
      actions: [
        Icon(Icons.notifications_none, color: Colors.black),
        Icon(Icons.tune, color: Colors.black),
        SizedBox(width: 15.w),
      ],
    );
  }

  Widget _buildToggleTabs() {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E4E7),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [_tab("All Instruments", true), _tab("Watchlist", false)],
      ),
    );
  }

  Widget _tab(String label, bool active) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF00A693) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: active ? Colors.white : Colors.black54,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        suffixIcon: const Icon(Icons.mic, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    List<String> cats = ["All", "Forex", "Indices", "Crypto", "Commodities"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cats
            .map(
              (e) => Container(
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: e == "All"
                      ? AppColors.primaryShade100
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: e == "All" ? AppColors.primary : Colors.transparent,
                  ),
                ),
                child: Text(
                  e,
                  style: GoogleFonts.instrumentSans(
                    color: e == "All"
                        ? AppColors.primary
                        : AppColors.outlineBorder,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        title,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}


