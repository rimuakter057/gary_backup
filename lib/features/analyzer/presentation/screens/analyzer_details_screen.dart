import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/analyzer/presentation/widgets/analyzer_bar_chart.dart';
import 'package:gary_goodger/features/analyzer/presentation/widgets/metric_title.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class AnalyzerDetailsScreen extends StatelessWidget {
  const AnalyzerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text("Performance ROI", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp)),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AnalyzerBarChart(),
            SizedBox(height: 25.h),

            Text("Key Metrics", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
            SizedBox(height: 15.h),

            const MetricTile(label: "Profit Factor", value: "1.78", status: "GOOD", statusColor: Colors.teal),
            const MetricTile(label: "Sharpe Ratio", value: "1.24", status: "HEALTHY", statusColor: Colors.blue),
            const MetricTile(label: "Daily Drawdown", value: "-1.5%", status: "WARNING", statusColor: Colors.orange),
            const MetricTile(label: "Win Rate", value: "62%", status: "AVERAGE", statusColor: Colors.grey),

            SizedBox(height: 20.h),
            _buildExpectancyCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildExpectancyCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Expectancy", style: TextStyle(color: Colors.white70, fontSize: 12.sp)),
              Text("+0.20R (\$22 / 0.19%)", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp)),
            ],
          ),
          const Icon(Icons.info_outline, color: Colors.white70),
        ],
      ),
    );
  }
}