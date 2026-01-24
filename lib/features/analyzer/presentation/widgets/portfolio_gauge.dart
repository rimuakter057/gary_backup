import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'dart:math' as math;


class PortfolioGauge extends StatelessWidget {
  const PortfolioGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Portfolio ROI", style: TextStyle(color: Colors.white60, fontSize: 12.sp)),
          ),
          SizedBox(height: 10.h),
          Stack(
            alignment: Alignment.center,
            children: [
              // Custom Gauge Painting logic goes here or use syncfusion_flutter_gauges
              SizedBox(
                height: 180.h,
                width: 180.h,
                child: CustomPaint(painter: GaugePainter()),
              ),
              Column(
                children: [
                  SizedBox(height: 40.h),
                  Text("14.8%", style: TextStyle(color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.bold)),
                  Text("▲ +2.1% from last month", style: TextStyle(color: AppColors.primary, fontSize: 10.sp)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.9;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.w
      ..strokeCap = StrokeCap.round;

    // Drawing the gradient arc based on the image
    final rect = Rect.fromCircle(center: center, radius: radius / 2);
    final gradient = SweepGradient(
      startAngle: math.pi,
      endAngle: 2 * math.pi,
      colors: [Colors.orange, Colors.yellow, AppColors.primary, Colors.blueGrey],
    );

    paint.shader = gradient.createShader(rect);
    canvas.drawArc(rect, math.pi, math.pi, false, paint);

    // Needle Drawing
    final needlePaint = Paint()..color = Colors.white54..strokeWidth = 3.w..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(center.dx + 40.w, center.dy - 50.h), needlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}