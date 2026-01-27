import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  final double percentage; // Value between 0.0 and 1.0 (e.g., 0.68)
  final Color activeColor;
  final Color backgroundColor;

  const CustomCircularProgress({
    super.key,
    required this.percentage,
    this.activeColor = const Color(0xFFFFB74D), // Image-er orange color
    this.backgroundColor = const Color(0xFFF0F2F5), // Light grey track
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background track
          SizedBox(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: 12,
              color: backgroundColor,
            ),
          ),
          // Active progress
          SizedBox(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
              value: percentage,
              strokeWidth: 12,
              strokeCap: StrokeCap.round, // Rounded edges as per image
              color: activeColor,
            ),
          ),
          // Percentage Text
          Text(
            "${(percentage * 100).toInt()}%",
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3E50), // Dark blue-grey text
            ),
          ),
        ],
      ),
    );
  }
}