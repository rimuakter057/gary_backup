import 'package:flutter/material.dart';
import 'package:gary_goodger/features/common/presentation/widgets/slip_page_symbol.dart';
import 'package:gary_goodger/features/common/presentation/widgets/spread_analysis.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/screens/account_screen.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/performance_card.dart';
import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';

import 'consistency_card_widget.dart';


class BrokerExecutionTabWidget extends StatelessWidget {
  const BrokerExecutionTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget gap =SizedBox(height: ResponsiveHelper.height(16));
    return Column(
      children: [
        SizedBox(height: ResponsiveHelper.height(12)),

        /// Graph Chart
        PerformanceCard(),
        SizedBox(height: ResponsiveHelper.height(16)),

        /// Insights Horizontal List
        const HorizontalStatsList(),

        gap,
        SlippageSymbolWidget(
          avgSlippage: -0.35,
          p95Slippage: -0.12,
        ),
        gap,
        SpreadAnalysisWidget(
          symbol: "XAUUSD",
          avgSpread: 1.6,
          maxSpread: 3.4,
        ),


        gap,
        CustomContainer(
          borderColor: AppColors.boarderColor,
          child: Column(
            children: [
              ConsistencyCardWidget(),
              gap,

              Row(
                children: [
                  Expanded(child: ConsistencyCardWidget()),
                  SizedBox(width: ResponsiveHelper.width(8)),
                  Expanded(child: ConsistencyCardWidget()),
                ],
              ),
            ],
          ),
        ),
        gap,

      ],
    );
  }
}
