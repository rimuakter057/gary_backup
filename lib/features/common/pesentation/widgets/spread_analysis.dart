import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SpreadAnalysisWidget extends StatelessWidget {
  final String symbol; // e.g., 'XAUUSD'
  final double avgSpread; // e.g., 1.6
  final double maxSpread; // e.g., 3.4

  const SpreadAnalysisWidget({
    super.key,
    required this.symbol,
    required this.avgSpread,
    required this.maxSpread,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Spread",
            style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 250,
            child: BarChart(
              BarChartData(
                maxY: 6,
                barTouchData: BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    axisNameWidget: const Text("Spread (pips)", style: TextStyle(color: Colors.grey, fontSize: 10)),
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(symbol, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      ),
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade100,
                    strokeWidth: 1,
                    dashArray: [5, 5],
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barsSpace: 0, // Dui bar-er majhe space thakbe na
                    barRods: [
                      // Average Spread Bar (Darker Teal)
                      BarChartRodData(
                        toY: avgSpread,
                        color: const Color(0xFF00796B),
                        width: 80,
                        borderRadius: BorderRadius.zero,
                      ),
                      // Maximum Spread Bar (Lighter Green)
                      BarChartRodData(
                        toY: maxSpread,
                        color: const Color(0xFF2ECC71),
                        width: 80,
                        borderRadius: BorderRadius.zero,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}