import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/common/presentation/widgets/status_outline_container.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/custom_switch_button.dart';
import 'package:gary_goodger/features/profile_screen/presentation/widgets/device_session_widget.dart';
import 'package:gary_goodger/features/profile_screen/presentation/widgets/invoice_widget.dart';
import 'package:gary_goodger/features/profile_screen/presentation/widgets/linked_trading_widget.dart';
import 'package:gary_goodger/features/profile_screen/presentation/widgets/notification_box_widget.dart';
import 'package:gary_goodger/features/profile_screen/presentation/widgets/payment_method_widget.dart';
import 'package:gary_goodger/features/profile_screen/presentation/widgets/profile_tile_widget.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_divider/custom_divider.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: 8.h);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              NotificationBoxWidget(gap: gap),
        
              ///notification setting==================================================================
              Text("notification setting"),
        
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Side: Text Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(AppText.slaveAccount, style: context.bodyMedium),
                            SizedBox(height: 4.h),
                            Text(
                              "RIsk Type: Lot Multiplier  Risk: 1%",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
        
                      CustomTealSwitch(
                        activeColor: AppColors.primary,
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                      ),
                    ],
                  ),
                  CustomDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Side: Text Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(AppText.slaveAccount, style: context.bodyMedium),
                            SizedBox(height: 4.h),
                            Text(
                              "RIsk Type: Lot Multiplier  Risk: 1%",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
        
                      CustomTealSwitch(
                        activeColor: AppColors.primary,
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              gap,
              SizedBox(height: 16.h),
              ///profile tile widget==============================================================
              ProfileTileWidget(),
              SizedBox(height: 16.h),
              ///invoice widget======================================
              InvoiceWidget(),
        
              SizedBox(height: 16.h),
        
              ///payment methode======================================
              PaymentMethodeWidget(),
        
              SizedBox(height: 16.h),
        
              ///Linked trading======================================
              LinkTradingWidget(),
              ///device trading======================================
        
          DeviceSessionWidget(),
        
        
            ],
          ),
        ),
      ),
    );
  }
}





