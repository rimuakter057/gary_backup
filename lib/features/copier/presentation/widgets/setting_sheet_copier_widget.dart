import 'package:flutter/material.dart';
import 'package:gary_goodger/core/routes/app_routes.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/setting_tile_copier_widget.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/screens/account_screen.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/delete_account_popup.dart';
import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';
import 'package:get/get.dart';


class SettingSheetCopierWidget extends StatelessWidget {
  const SettingSheetCopierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveHelper.screenHeight * 0.3,
      padding: EdgeInsets.all(ResponsiveHelper.padding(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(ResponsiveHelper.borderRadius(20)),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              AppText.masterAccountSettings,
              style: context.bodyLarge.copyWith(
                fontSize: ResponsiveHelper.fontSize(18),
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(4)),

            // Subtitle
            Text(
              AppText.showingListOfAllAccounts,
              style: context.bodySmall.copyWith(
                fontSize: ResponsiveHelper.fontSize(14),
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(12)),

            Column(
              children: [


                ///slave account setting=======================================================================

                SettingTileCopierWidget(
                  icon: AppAssets.addSlaveCopier,
                  title: AppText.addSlave,
                  onTap: () {  },

                ),


                SettingTileCopierWidget(
                    icon: AppAssets.deleteAccountDashboard,
                    title: AppText.deleteMasterAccount,
                    color: AppColors.red,
                    onTap: () {  },

                ),




              ],
            ),
          ],
        ),
      ),
    );
  }
}

