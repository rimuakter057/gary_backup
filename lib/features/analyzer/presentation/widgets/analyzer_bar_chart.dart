import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';


class AnalyzerBarChart extends StatelessWidget {
  const AnalyzerBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 20,
          minY: -20,
          gridData: FlGridData(show: true, drawVerticalLine: false,
              getDrawingHorizontalLine: (value) => FlLine(color: Colors.white10, strokeWidth: 1)),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30,
                getTitlesWidget: (val, meta) => Text("${val.toInt()}%", style: TextStyle(color: Colors.white38, fontSize: 8.sp)))),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,
                getTitlesWidget: (val, meta) {
                  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];
                  return Text(months[val.toInt() % 7], style: TextStyle(color: Colors.white38, fontSize: 10.sp));
                })),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            _makeGroup(0, 10, isPositive: true),
            _makeGroup(1, -8, isPositive: false),
            _makeGroup(2, 15, isPositive: true),
            _makeGroup(3, -12, isPositive: false),
            _makeGroup(4, 8, isPositive: true),
            _makeGroup(5, -5, isPositive: false),
            _makeGroup(6, 12, isPositive: true),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _makeGroup(int x, double y, {required bool isPositive}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isPositive ? AppColors.primary : Colors.redAccent,
          width: 12.w,
          borderRadius: BorderRadius.circular(4.r),
          backDrawRodData: BackgroundBarChartRodData(show: true, toY: 20, color: Colors.white),
        ),
      ],
    );
  }
}