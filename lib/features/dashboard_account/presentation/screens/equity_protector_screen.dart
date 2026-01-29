import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/account_appbar_row_widget.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/custom_switch_button.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/notification_tile_widget.dart';
import 'package:gary_goodger/share/widgets/custom_appbar/custom_appbar_container.dart';
import 'package:gary_goodger/share/widgets/custom_divider/custom_divider.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';

class EquityProtectorScreen extends StatefulWidget {
  const EquityProtectorScreen({super.key});

  @override
  State<EquityProtectorScreen> createState() => _EquityProtectorScreenState();
}

class _EquityProtectorScreenState extends State<EquityProtectorScreen> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarContainer(
            child: Column(
              children: [
                CustomAppbarWidget(
                  title: AppText.equityProtector,
                ),
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
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    CustomContainerBorderParent(
                      borderColor: AppColors.boarderColor,
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppText.equityProtection,
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.greySwitch,
                              ),
                            ),

                            SizedBox(height: 8.h),

                            NotificationTileWidget(
                              leadingIcon: AppAssets.notificationPrimary,
                              title: AppText.accountManagement,
                              subtitle: AppText.descriptionWillGoHere,
                              showSwitch: true, // trailing switch
                              switchValue: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                            ),
                            CustomDivider(),
                            NotificationTileWidget(
                              leadingIcon: AppAssets.notificationPrimary,
                              title: AppText.accountManagement,
                              subtitle: AppText.descriptionWillGoHere,
                              showSwitch: true, // trailing switch
                              switchValue: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                            ),
                            CustomDivider(),
                            NotificationTileWidget(
                              leadingIcon: AppAssets.notificationPrimary,
                              title: AppText.accountManagement,
                              subtitle: AppText.descriptionWillGoHere,
                              showSwitch: true, // trailing switch
                              switchValue: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomContainerBorderParent(
                      borderColor: AppColors.boarderColor,
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppText.stopLoseProtection,
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.greySwitch,
                              ),
                            ),

                            SizedBox(height: 8.h),

                            NotificationTileWidget(
                              leadingIcon: AppAssets.notificationPrimary,
                              title: AppText.accountManagement,
                              subtitle: AppText.descriptionWillGoHere,
                              showSwitch: true, // trailing switch
                              switchValue: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                            ),
                            CustomDivider(),
                            NotificationTileWidget(
                              leadingIcon: AppAssets.notificationPrimary,
                              title: AppText.accountManagement,
                              subtitle: AppText.descriptionWillGoHere,
                              showSwitch: true, // trailing switch
                              switchValue: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                            ),
                            CustomDivider(),
                            NotificationTileWidget(
                              leadingIcon: AppAssets.notificationPrimary,
                              title: AppText.accountManagement,
                              subtitle: AppText.descriptionWillGoHere,
                              showSwitch: true, // trailing switch
                              switchValue: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomContainerBorderParent(
                      borderColor: AppColors.boarderColor,
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppText.takeProfitProtection,
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.greySwitch,
                              ),
                            ),

                            SizedBox(height: 8.h),

                            NotificationTileWidget(
                              leadingIcon: AppAssets.notificationPrimary,
                              title: "Another Tile",
                              subtitle: "Trailing as text",
                              showSwitch: false, // trailing text
                              trailingText: "0.0%",
                            ),
                            CustomDivider(),
                            NotificationTileWidget(
                              leadingIcon: AppAssets.notificationPrimary,
                              title: "Another Tile",
                              subtitle: "Trailing as text",
                              showSwitch: false, // trailing text
                              trailingText: "0.0%",
                            ),
                            CustomDivider(),
                            NotificationTileWidget(
                              leadingIcon: AppAssets.notificationPrimary,
                              title: "Another Tile",
                              subtitle: "Trailing as text",
                              showSwitch: false, // trailing text
                              trailingText: "0.0%",
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
  const CustomAppbarWidget({
    super.key, required this.title, this.action,
  });
final String title;
final  Widget?action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(

  onTap: (){},
  child: CustomImage(imageSrc: AppAssets.arrowBack)),
        Text(title, style: context.bodyLarge),
        action??SizedBox(),
      ],
    );
  }
}
