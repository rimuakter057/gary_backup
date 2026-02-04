import 'package:flutter/material.dart';
import 'package:gary_goodger/features/compare/presentation/widgets/general_card_widget.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/custom_appbar_copier.dart';
import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_divider/custom_divider.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';

class ComparisonScreen extends StatelessWidget {
  const ComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.height(12));
    return Scaffold(
      appBar: CustomAppBarCopier(title: AppText.comparison),
      body: Padding(
        padding: ResponsiveHelper.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            gap,
            CustomContainer(
              borderColor: AppColors.boarderColor,
              child: Column(
                children: [
                  gap,

                  GeneralCardWidget(
                    title: AppText.country,

                    title1: 'FundingPips',
                    value1: 'United Arab Emirates (AE)',
                    title2: 'The5ers',
                    value2: 'Great Britain (GB)',
                  ),
                  SizedBox(height: ResponsiveHelper.height(12)),
                  GeneralCardWidget(
                    title: AppText.yearsInOperation,
                    title1: 'FundingPips',
                    value1: '2',
                    title2: 'The5ers',
                    value2: '3',
                    valueColor1: AppColors.green,
                    valueColor2: AppColors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
