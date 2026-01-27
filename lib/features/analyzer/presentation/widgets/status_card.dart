import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_divider/custom_divider.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';


class StatisticsAnalyzerCard extends StatelessWidget {
  final String title;
  final String mainValue;
  final List<Map<String, String>> details;

  const StatisticsAnalyzerCard({super.key, required this.title, required this.mainValue, required this.details});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        //backgroundColor: AppColors.backgroundColor,
        backgroundColor: AppColors.white,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(title,style: context.bodySmall,),
      Text(mainValue,style: context.bodySmall,),
         SizedBox(height: 16.h,),
      CustomDivider(),
        SizedBox(height: 16.h,),
        _buildRow(context,title: title,mainValue: mainValue),
        SizedBox(height: 4.h,),
        _buildRow(context,title: title,mainValue: mainValue),
        SizedBox(height: 4.h,),
        _buildRow(context,title: title,mainValue: mainValue),
      
    ],));
  }

  Row _buildRow(BuildContext context,{required String title,required mainValue}) {
    return Row(
        children: [
          Text(title,style: context.bodySmall.copyWith(fontWeight: FontWeight.w600),),
          SizedBox(width: 4.w,),
          Text("- $mainValue",style: context.bodySmall,),
        ],
      );
  }
}