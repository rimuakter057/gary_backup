import 'package:flutter/material.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_divider/custom_divider.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';
import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';

class StatisticsAnalyzerCard extends StatelessWidget {
  final String title;
  final String mainValue;
  final List<Map<String, String>> details;

  const StatisticsAnalyzerCard({
    super.key,
    required this.title,
    required this.mainValue,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.bodySmall.copyWith(
            fontSize: ResponsiveHelper.fontSize(14),
          )),
          Text(mainValue, style: context.bodySmall.copyWith(
            fontSize: ResponsiveHelper.fontSize(14),
          )),
          SizedBox(height: ResponsiveHelper.height(16)),
          CustomDivider(),
          SizedBox(height: ResponsiveHelper.height(16)),
          _buildRow(context, title: title, mainValue: mainValue),
          SizedBox(height: ResponsiveHelper.height(4)),
          _buildRow(context, title: title, mainValue: mainValue),
          SizedBox(height: ResponsiveHelper.height(4)),
          _buildRow(context, title: title, mainValue: mainValue),
        ],
      ),
    );
  }

  Row _buildRow(BuildContext context,
      {required String title, required mainValue}) {
    return Row(
      children: [
        Text(
          title,
          style: context.bodySmall.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: ResponsiveHelper.fontSize(14),
          ),
        ),
        SizedBox(width: ResponsiveHelper.width(4)),
        Text(
          "- $mainValue",
          style: context.bodySmall.copyWith(
            fontSize: ResponsiveHelper.fontSize(14),
          ),
        ),
      ],
    );
  }
}
