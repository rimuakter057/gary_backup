import 'package:flutter/material.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/custom_switch_button.dart';
import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';

class MasterAccountScreen extends StatefulWidget {
  const MasterAccountScreen({super.key});

  @override
  State<MasterAccountScreen> createState() => _MasterAccountScreenState();
}

class _MasterAccountScreenState extends State<MasterAccountScreen> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Master Account 1", style: context.bodyLarge)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ResponsiveHelper.width(8)),
        child: Column(
          children: [
            CustomContainer(
              vertical: ResponsiveHelper.height(16),
              horizontal: ResponsiveHelper.width(16),
              backgroundColor: AppColors.white,
              borderColor: AppColors.boarderColor,
              child: CustomContainer(
                borderColor: AppColors.boarderColor,
                backgroundColor: AppColors.white,
                vertical: ResponsiveHelper.height(8),
                horizontal: ResponsiveHelper.width(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left Side: Text Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(AppText.slaveAccount, style: context.bodyMedium),
                          SizedBox(height: ResponsiveHelper.height(4)),
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
              ),
            ),
            SizedBox(height: ResponsiveHelper.height(12),),
            CustomContainer(
              backgroundColor: AppColors.white,
              borderColor: AppColors.boarderColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enabled Slaves (07)",style: context.bodySmall,),
                 
                  SizedBox(height: ResponsiveHelper.height(12),),
                   CustomContainer(
                    borderColor: AppColors.orange,
                    backgroundColor: AppColors.orangeShadeBg,
                    vertical: ResponsiveHelper.height(8),
                    horizontal: ResponsiveHelper.width(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left Side: Text Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(AppText.slaveAccount, style: context.bodyMedium),
                              SizedBox(height: ResponsiveHelper.height(4)),
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
                          activeColor: AppColors.orange,
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: ResponsiveHelper.height(8),),
                  CustomContainer(
                    borderColor: AppColors.orange,
                    backgroundColor: AppColors.orangeShadeBg,
                    vertical: ResponsiveHelper.height(8),
                    horizontal: ResponsiveHelper.width(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left Side: Text Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(AppText.slaveAccount, style: context.bodyMedium),
                              SizedBox(height: ResponsiveHelper.height(4)),
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
                          activeColor: AppColors.orange,
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                      ],
                    ),
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
