import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SessionAnalysisWidget extends StatelessWidget {
  final List<double> sessionRoi; // e.g., [0.52, 1.69, 0.76]
  final List<String> sessions;   // e.g., ['Asia', 'London', 'New York']

  const SessionAnalysisWidget({
    super.key,
    required this.sessionRoi,
    required this.sessions,
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
            "Session Analysis",
            style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 250,
            child: BarChart(
              BarChartData(
                maxY: 1.75,
                alignment: BarChartAlignment.spaceAround,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) => const Color(0xFF1E1E1E),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '10/01/2026\n\n',
                        const TextStyle(color: Colors.grey, fontSize: 10),
                        children: [
                          const TextSpan(
                            text: 'TRADES     ROI\n',
                            style: TextStyle(color: Colors.grey, fontSize: 8),
                          ),
                          TextSpan(
                            text: '88         ${rod.toY}%',
                            style: const TextStyle(color: Color(0xFF00A38D), fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    axisNameWidget: const Text("ROI % (0 → 1.75%)", style: TextStyle(color: Colors.grey, fontSize: 10)),
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 45,
                      getTitlesWidget: (value, meta) => Text(
                        "${value.toStringAsFixed(2)}%",
                        style: const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < sessions.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(sessions[index], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(color: Colors.grey.shade100, strokeWidth: 1, dashArray: [5, 5]),
                ),
                borderData: FlBorderData(show: false),
                barGroups: List.generate(sessionRoi.length, (i) {
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: sessionRoi[i],
                        color: const Color(0xFF00A38D),
                        width: 60,
                        borderRadius: BorderRadius.zero,
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}