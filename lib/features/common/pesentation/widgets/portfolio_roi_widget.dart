import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PortfolioROIWidget extends StatelessWidget {
  final double roiValue; // Example: 14.8
  final String percentageChange; // Example: "+2.1%"

  const PortfolioROIWidget({
    super.key,
    required this.roiValue,
    required this.percentageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C1E), // Card background
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Portfolio ROI",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),

          // The Gauge Chart
          SizedBox(
            height: 180,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: -100,
                  maximum: 100,
                  startAngle: 180,
                  endAngle: 0,
                  showLabels: false,
                  showTicks: true,
                  axisLineStyle: const AxisLineStyle(
                    thickness: 0.2,
                    thicknessUnit: GaugeSizeUnit.factor,
                    gradient: SweepGradient(
                      colors: <Color>[Colors.redAccent, Colors.orange, Colors.yellow, Colors.greenAccent, Colors.tealAccent],
                      stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
                    ),
                  ),
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: roiValue,
                      needleColor: Colors.grey[700]!,
                      knobStyle: KnobStyle(color: Colors.grey[800]!, knobRadius: 0.08),
                      needleLength: 0.6,
                    )
                  ],
                )
              ],
            ),
          ),

          // Value and Text
          Text(
            "$roiValue%",
            style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$percentageChange from last month",
                style: const TextStyle(color: Color(0xFF2ECC71), fontSize: 14),
              ),
              const Icon(Icons.arrow_upward, color: Color(0xFF2ECC71), size: 16),
            ],
          ),
        ],
      ),
    );
  }
}