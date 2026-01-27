import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class OverviewAreaChart extends StatelessWidget {
  final List<double> dataPoints; // e.g., [10, 15, 12, 20, 25, 28]

  const OverviewAreaChart({super.key, required this.dataPoints});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Image onujayi height set kora hoyeche
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA), // Very light grey background
        borderRadius: BorderRadius.circular(16),
      ),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: (dataPoints.length - 1).toDouble(),
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints.asMap().entries.map((e) {
                return FlSpot(e.key.toDouble(), e.value);
              }).toList(),
              isCurved: true, // Smooth curve-er jonno
              curveSmoothness: 0.35,
              color: const Color(0xFFF39C12), // Orange line color
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false), // Dots bondho kora hoyeche
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFF39C12).withOpacity(0.2), // Faded orange
                    const Color(0xFFF39C12).withOpacity(0.01),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}