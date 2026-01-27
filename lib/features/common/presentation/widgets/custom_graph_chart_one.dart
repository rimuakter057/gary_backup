import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomGraphCard extends StatelessWidget {
  final String totalBalance;
  final String percentage;
  final String openBalance;
  final List<FlSpot> mainData;
  final List<FlSpot> secondaryData;

  const CustomGraphCard({
    super.key,
    required this.totalBalance,
    required this.percentage,
    required this.openBalance,
    required this.mainData,
    required this.secondaryData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117), // Dark Background
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    totalBalance,
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    percentage,
                    style: const TextStyle(color: Color(0xFF2ECC71), fontSize: 14),
                  ),
                ],
              ),
              Text(
                "\$$openBalance open",
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Custom Tab Selector (Simplified)
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                _buildTab("Week", isActive: true),
                _buildTab("Month"),
                _buildTab("Year"),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Line Chart
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white10,
                    strokeWidth: 1,
                    dashArray: [5, 5],
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
                        return Text(days[value.toInt() % 7], style: const TextStyle(color: Colors.grey, fontSize: 12));
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  _lineData(mainData, const Color(0xFF26A69A), true), // Teal Line
                  _lineData(secondaryData, Colors.white24, false),   // Grey Line
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, {bool isActive = false}) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF26A69A) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(color: isActive ? Colors.white : Colors.grey),
        ),
      ),
    );
  }

  LineChartBarData _lineData(List<FlSpot> spots, Color color, bool isMain) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      color: color,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: isMain
          ? BarAreaData(show: true, color: color.withOpacity(0.1))
          : BarAreaData(show: false),
    );
  }
}