import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/account_appbar_row_widget.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/switch_trading_symbol.dart';
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
                SizedBox(height: 8.h),
                AccountAppbarRowWidget(),
                SizedBox(height: 12.h),
              ],
            ),
          ),
          SizedBox(height: 12.h),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // corner radius
                        side: BorderSide(
                          color: AppColors.boarderColor,
                          width: 1, // border width
                        ),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppText.forex, style: context.bodyMedium),
                                Row(
                                  children: [
                                    Text(
                                      "3 ${AppText.enabled}",
                                      style: context.bodySmall,
                                    ),
                                    CustomImage(imageSrc: AppAssets.dropUp),
                                  ],
                                ),
                              ],
                            ),

                            CustomDivider(),

                            TradingSymbolWidget(
                              title: AppText.eurUsd,
                              value: true,
                              onChanged: (bool value) {},
                            ),
                            SizedBox(height: 12.h),
                            TradingSymbolWidget(
                              title: AppText.eurUsd,
                              value: true,
                              onChanged: (bool value) {},
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Card(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: AppColors.boarderColor,
                          width: 1,
                        ),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${AppText.group} 2",
                                  style: context.bodyMedium,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "3 ${AppText.enabled}",
                                      style: context.bodySmall,
                                    ),
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
        Text(title, style: context.bodyLarge),
        action ?? SizedBox(),
      ],
    );
  }
}
