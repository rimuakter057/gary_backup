import 'package:flutter/material.dart';
import 'package:gary_goodger/features/analyzer/presentation/widgets/rist_out_chart.dart';
import 'package:gary_goodger/features/analyzer/presentation/widgets/chart/roling_profit_factor_chart.dart';
import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';

import 'consistency_card_widget.dart';

class RiskConsistencyTabWidget extends StatelessWidget {
  const RiskConsistencyTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.height(24));
    return Column(
      children: [
        RiskOutcomeChart(
          values: [0.14, -0.20, 0.30, 0.05],
          labels: ["-0.3% Risk", "-0.8% Risk", "1.1% Risk", "0.5% Risk"],
        ),

        gap,

        CustomContainer(
          borderColor: AppColors.boarderColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.losingStreaksAndRecovery,
                style: context.bodySmall.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: ResponsiveHelper.height(12)),

              Row(
                children: [
                  Expanded(child: ConsistencyCardWidget()),
                  SizedBox(width: ResponsiveHelper.width(8),),
                  Expanded(child: ConsistencyCardWidget()),
                ],
              ),
              SizedBox(height: ResponsiveHelper.height(12)),
              Row(
                children: [
                  Expanded(child: ConsistencyCardWidget()),
                  SizedBox(width: ResponsiveHelper.width(8),),
                  Expanded(child: ConsistencyCardWidget()),
                ],
              ),
            ],
          ),
        ),

        gap,

        RollingProfitFactorWidget(
          pfData: {
            '1 Oct': 1.50,
            '2 Oct': 1.70,
            '3 Oct': 1.60,
            '4 Oct': 1.55,
            '5 Oct': 1.75,
            '7 Oct': 1.83,
          },
        ),
        gap,
      ],
    );
  }
}


