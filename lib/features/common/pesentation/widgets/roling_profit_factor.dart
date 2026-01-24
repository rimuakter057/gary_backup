import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RollingProfitFactorWidget extends StatelessWidget {
  final Map<String, double> pfData; // Example: {'1 Oct': 1.5, '2 Oct': 1.7, ...}

  const RollingProfitFactorWidget({super.key, required this.pfData});

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
            "Rolling Profit Factor",
            style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 250,
            child: LineChart(
              LineChartData(
                minY: 1.40,
                maxY: 2.00,
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (touchedSpot) => const Color(0xFF1E1E1E),
                    getTooltipItems: (List<LineBarSpot> touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          '30/01/2026\n\n',
                          const TextStyle(color: Colors.grey, fontSize: 10),
                          children: [
                            const TextSpan(
                              text: 'TRADES     PF\n',
                              style: TextStyle(color: Colors.grey, fontSize: 8),
                            ),
                            TextSpan(
                              text: '35         ${spot.y}',
                              style: const TextStyle(
                                color: Color(0xFF00A38D),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      }).toList();
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    axisNameWidget: const Text("Profit Factor", style: TextStyle(color: Colors.grey, fontSize: 10)),
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) => Text(
                        value.toStringAsFixed(2),
                        style: const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < pfData.keys.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              pfData.keys.elementAt(index),
                              style: const TextStyle(color: Colors.grey, fontSize: 10),
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
                lineBarsData: [
                  LineChartBarData(
                    spots: pfData.values.toList().asMap().entries.map((e) {
                      return FlSpot(e.key.toDouble(), e.value);
                    }).toList(),
                    isCurved: false,
                    color: const Color(0xFF00897B),
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
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