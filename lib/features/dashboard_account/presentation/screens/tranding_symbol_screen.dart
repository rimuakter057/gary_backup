import 'package:flutter/material.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/Widgets/account_appbar_row_widget.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/Widgets/switch_trading_symbol.dart';
import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';
import 'package:gary_goodger/share/widgets/custom_appbar/custom_appbar_container.dart';
import 'package:gary_goodger/share/widgets/custom_divider/custom_divider.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';


class TradingSymbolScreen extends StatefulWidget {
  const TradingSymbolScreen({super.key});

  @override
  State<TradingSymbolScreen> createState() => _TradingSymbolScreenState();
}

class _TradingSymbolScreenState extends State<TradingSymbolScreen> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(
        children: [
          CustomAppBarContainer(
            child: Column(
              children: [
                CustomAppbarWidget(title: AppText.equityProtector),
                SizedBox(height: ResponsiveHelper.height(8)),
                AccountAppbarRowWidget(

                ),
                SizedBox(height: ResponsiveHelper.height(12)),
              ],
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(12)),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(ResponsiveHelper.width(8)),
                child: Column(
                  children: [
                    // === First Card ===
                    Card(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(ResponsiveHelper.borderRadius(8)),
                        side: BorderSide(
                          color: AppColors.boarderColor,
                          width: ResponsiveHelper.borderWidth(1),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(ResponsiveHelper.width(8)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppText.forex,
                                  style: context.bodyMedium.copyWith(
                                    fontSize: ResponsiveHelper.fontSize(14),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "3 ${AppText.enabled}",
                                      style: context.bodySmall.copyWith(
                                        fontSize: ResponsiveHelper.fontSize(12),
                                      ),
                                    ),
                                    SizedBox(width: ResponsiveHelper.width(4)),
                                    CustomImage(imageSrc: AppAssets.dropUp),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: ResponsiveHelper.height(8)),
                            CustomDivider(),

                            TradingSymbolWidget(
                              title: AppText.eurUsd,
                              value: true,
                              onChanged: (bool value) {},
                            ),
                            SizedBox(height: ResponsiveHelper.height(12)),
                            TradingSymbolWidget(
                              title: AppText.eurUsd,
                              value: true,
                              onChanged: (bool value) {},
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: ResponsiveHelper.height(16)),

                    // === Second Card ===
                    Card(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(ResponsiveHelper.borderRadius(8)),
                        side: BorderSide(
                          color: AppColors.boarderColor,
                          width: ResponsiveHelper.borderWidth(1),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(ResponsiveHelper.width(16)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${AppText.group} 2",
                                  style: context.bodyMedium.copyWith(
                                    fontSize: ResponsiveHelper.fontSize(14),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "3 ${AppText.enabled}",
                                      style: context.bodySmall.copyWith(
                                        fontSize: ResponsiveHelper.fontSize(12),
                                      ),
                                    ),
                                    SizedBox(width: ResponsiveHelper.width(4)),
                                    CustomImage(imageSrc: AppAssets.dropUp),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// === Custom Appbar ===
class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({super.key, required this.title, this.action});
  final String title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: CustomImage(imageSrc: AppAssets.arrowBack),
        ),
        Text(
          title,
          style: context.bodyLarge.copyWith(
            fontSize: ResponsiveHelper.fontSize(18),
          ),
        ),
        action ?? SizedBox(),
      ],
    );
  }
}
