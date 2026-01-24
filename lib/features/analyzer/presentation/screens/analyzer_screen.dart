import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/analyzer/presentation/widgets/portfolio_gauge.dart';


import 'package:gary_goodger/features/analyzer/presentation/widgets/status_card.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/insight_card.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';



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
        title: Text("Analyzer", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [Icon(Icons.notifications_none_outlined, color: Colors.black), Icon(Icons.filter_list, color: Colors.black), SizedBox(width: 10.w)],
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
            StatsCard(
                title: "Total PNL",
                mainValue: "\$12,437",
                details: [{"Fees/Swaps": "-\$312"}, {"Commissions": "-\$198"}, {"Best day": "+\$1,700"}]
            ),
            StatsCard(
                title: "Equity",
                mainValue: "\$92,435",
                details: [{"Balance": "591,590"}, {"From peak": "-3.2%"}, {"Free margin": "583,370 (91%)"}]
            ),

            InsightCard(),

          ],
        ),
      ),
    );
  }

  // Same dropdown logic as Dashboard
  Widget _buildDropdownHeader() { /* code from previous response */ return Container(); }

  Widget _buildTabSelector() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(color: Color(0xFFE0E4E7), borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          Expanded(child: Container(padding: EdgeInsets.all(8.h), decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8.r)), child: Center(child: Text("Performance", style: TextStyle(color: Colors.white))))),
          Expanded(child: Center(child: Text("Analysis Hub"))),
        ],
      ),
    );
  }
}