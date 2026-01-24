import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/analyzer/presentation/widgets/roi_heat_map.dart';
import 'package:gary_goodger/features/analyzer/presentation/widgets/trade_log_title.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class AnalyzerHeatmapScreen extends StatelessWidget {
  const AnalyzerHeatmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Icon(Icons.grid_view_rounded, color: AppColors.primary),
        title: Text("Analyzer", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [Icon(Icons.notifications_none_outlined, color: Colors.black), Icon(Icons.tune, color: Colors.black), SizedBox(width: 15.w)],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs placeholder (Performance / Analysis Hub)
            _buildTopTabs(),
            SizedBox(height: 20.h),

            // Sub-tabs (ROI Heatmap & Trades etc.)
            _buildSubTabs(),
            SizedBox(height: 15.h),

            const ROIHeatmap(),

            SizedBox(height: 25.h),
            Text("Last 10 Trades", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp)),
            SizedBox(height: 15.h),

            // Trade List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) => const TradeLogTile(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopTabs() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(color: const Color(0xFFE0E4E7), borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          _tab("Performance", false),
          _tab("Analysis Hub", true),
        ],
      ),
    );
  }

  Widget _tab(String label, bool active) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: active ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(child: Text(label, style: TextStyle(color: active ? Colors.white : Colors.black54))),
      ),
    );
  }

  Widget _buildSubTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ["ROI Heatmap & Trades", "Risk Monitors", "Other"].map((e) {
          bool active = e == "ROI Heatmap & Trades";
          return Container(
            margin: EdgeInsets.only(right: 8.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: active ? AppColors.primary.withOpacity(0.1) : Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: active ? AppColors.primary : AppColors.black),
            ),
            child: Text(e, style: TextStyle(color: active ? AppColors.primary : Colors.black54, fontSize: 11.sp)),
          );
        }).toList(),
      ),
    );
  }
}