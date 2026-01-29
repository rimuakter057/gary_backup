import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child; // Required
  final Color? backgroundColor;
  final Color? borderColor;
  final double? radius;
  final double? width;
  final double? height;

  final EdgeInsetsGeometry? margin;
  final double? vertical;
  final double? horizontal;

  const CustomContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.radius,
    this.width,
    this.height,

    this.margin, this.vertical, this.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: horizontal??16,vertical: vertical??16),
      width: width,
      height:height,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(radius ?? 8),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: child,
    );
  }
}
