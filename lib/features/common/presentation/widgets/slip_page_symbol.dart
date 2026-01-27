import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SlippageSymbolWidget extends StatelessWidget {
  final double avgSlippage; // e.g., -0.35
  final double p95Slippage; // e.g., -0.12

  const SlippageSymbolWidget({
    super.key,
    required this.avgSlippage,
    required this.p95Slippage,
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
            "Slippage by Symbol",
            style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    startDegreeOffset: 270,
                    sectionsSpace: 0,
                    centerSpaceRadius: 70,
                    sections: [
                      PieChartSectionData(
                        color: const Color(0xFF00897B), // Dark Teal
                        value: 75,
                        radius: 20,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        color: const Color(0xFF2ECC71), // Light Green
                        value: 25,
                        radius: 20,
                        showTitle: false,
                      ),
                    ],
                  ),
                ),
                // Tooltip on the right side of the ring
                Positioned(
                  right: 20,
                  child: _buildChartTooltip(avgSlippage),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoTile("Avg Slippage (pips)", avgSlippage, const Color(0xFF00897B)),
              _buildInfoTile("P95 Slippage (pips)", p95Slippage, const Color(0xFF2ECC71)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartTooltip(double value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("AVG SLIPPAGE (PIPS)", style: TextStyle(color: Colors.grey, fontSize: 8)),
          Text("$value", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, double value, Color indicatorColor) {
    return Row(
      children: [
        Container(width: 3, height: 40, color: indicatorColor),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            Text("$value", style: const TextStyle(color: Color(0xFF2D2D2D), fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}