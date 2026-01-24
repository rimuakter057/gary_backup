import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DrawdownSeriesWidget extends StatelessWidget {
  final Map<String, double> drawdownData; // Example: {'1 Oct': -0.6, '2 Oct': -1.0}

  const DrawdownSeriesWidget({super.key, required this.drawdownData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white, // Image background color
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Drawdown Series",
            style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 250,
            child: BarChart(
              BarChartData(
                minY: -1.0,
                maxY: 0.1,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade200,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 35,
                      getTitlesWidget: (value, meta) => Text(
                        value.toStringAsFixed(1),
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < drawdownData.keys.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              drawdownData.keys.elementAt(index),
                              style: const TextStyle(color: Colors.grey, fontSize: 11),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                barGroups: List.generate(
                  drawdownData.length,
                      (index) => BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: drawdownData.values.elementAt(index),
                        color: const Color(0xFFFF4D4D), // Red bar color
                        width: 25,
                        borderRadius: BorderRadius.zero,
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 0,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(y: 0, color: Colors.red, strokeWidth: 1),
                  ],
                ),
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text("Dates", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}