import 'package:flutter/material.dart';
import 'package:gary_goodger/core/routes/app_routes.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/card_title_text_widget.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/custom_appbar_copier.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/edit_slave_tile_widget.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/setting_tile_copier_widget.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/trading_sheet_widget.dart';
import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_divider/custom_divider.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:get/get.dart';

class TradingHourScreen extends StatelessWidget {
  const TradingHourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget gap =SizedBox(height: ResponsiveHelper.height(18));
    return Scaffold(
      appBar: CustomAppBarCopier(
        title: AppText.tradingHours,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  ResponsiveHelper.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///advance  setting =========================================================================
              gap,

              CustomContainer(
                borderColor: AppColors.boarderColor,
                child: SettingTileCopierWidget(
                  icon: AppAssets.clockCopier,
                  title: AppText.addTradingHour,
                  onTap: () {
                 Get.bottomSheet(

                     TradingSheetWidget(),
                 );
                  },

                ),

              ),

              gap,
              ///other Protection =========================================================================
              CustomContainer(
                borderColor: AppColors.boarderColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardTitleTextWidget(title: AppText.otherProtection),

                    SizedBox(height: ResponsiveHelper.height(8)),
                    EditSlaveTileWidget(
                      title: AppText.copyStopLoss,
                    ),
                    CustomDivider(),
                    EditSlaveTileWidget(
                      title: AppText.copyTakeProfit,
                    ),
                    CustomDivider(),
                    EditSlaveTileWidget(
                      title: AppText.copyPendingOrders,
                    ),




                  ],
                ),
              ),
              gap,

              gap,
              ElevatedButton(onPressed: (){},
                  child: Text(AppText.saveSettings)
              )

            ],
          ),
        ),
      ),
    );
  }
}
