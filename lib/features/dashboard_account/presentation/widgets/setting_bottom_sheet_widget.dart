
import 'package:flutter/material.dart';
import 'package:gary_goodger/core/routes/app_routes.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/screens/account_screen.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';
import 'package:get/get.dart';



class SettingBottomSheetWidget extends StatelessWidget {
  const SettingBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              AppText.selectAccount,
              style: context.bodyLarge,
            ),

            const SizedBox(height: 4),

            Text(
              AppText.showingListOfAllAccounts,
              style: context.bodySmall,
            ),

            const SizedBox(height: 12),

            const SizedBox(height: 12),

            Column(
              children: [
                SelectAccountTitleWidget(
                  icon: AppAssets.accountManagementDashboard,
                  title: AppText.accountManagement,
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.equityProtectorScreen);
                  },
                  child: SelectAccountTitleWidget(
                    icon: AppAssets.equityProtectorDashboard,
                    title: AppText.equityProtector,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.tradingSymbolScreen);
                  },
                  child: SelectAccountTitleWidget(
                    icon: AppAssets.tradingSymbolDashboard,
                    title: AppText.tradingSymbols,
                  ),
                ),
                SelectAccountTitleWidget(
                  icon: AppAssets.deleteAccountDashboard,
                  title: AppText.deleteAccount,
                  titleColor: AppColors.red,

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}