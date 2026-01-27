import 'package:flutter/material.dart';

class DayOfWeekROI extends StatelessWidget {
  final Map<String, double> data; // Example: {'Mon': 0.8, 'Fri': -0.7}

  const DayOfWeekROI({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF11141D),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Day of Week ROI", style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 20),
          ...data.entries.map((e) => _buildRow(e.key, e.value)).toList(),
          const SizedBox(height: 10),
          _buildBottomScale(),
        ],
      ),
    );
  }

  Widget _buildRow(String day, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(width: 40, child: Text(day, style: const TextStyle(color: Colors.grey, fontSize: 12))),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Divider(color: Colors.white10), // Background line
                Align(
                  alignment: Alignment.center,
                  child: Container(width: 1, height: 20, color: Colors.white30), // Zero line
                ),
                Align(
                  alignment: Alignment(value, 0), // Maps value to alignment
                  child: Container(
                    height: 2,
                    width: (value.abs() * 100), // Width based on value
                    color: value >= 0 ? const Color(0xFF26A69A) : Colors.redAccent,
                  ),
                ),
                Align(
                  alignment: Alignment(value, 0),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: value >= 0 ? const Color(0xFF26A69A) : Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomScale() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 40),
        Text("-1.0", style: TextStyle(color: Colors.grey, fontSize: 10)),
        Text("0.0", style: TextStyle(color: Colors.grey, fontSize: 10)),
        Text("1.0", style: TextStyle(color: Colors.grey, fontSize: 10)),
      ],
    );
  }
}