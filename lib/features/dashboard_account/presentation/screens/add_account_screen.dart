import 'package:flutter/material.dart';
import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';
import 'package:get/get.dart';


class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                height: ResponsiveHelper.height(400), // 50% approx of phone height
                padding: ResponsiveHelper.all(16),
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
                        AppText.selectAccount,
                        style: context.bodyLarge.copyWith(
                          fontSize: ResponsiveHelper.fontSize(18),
                        ),
                      ),

                      SizedBox(height: ResponsiveHelper.spacing(4)),

                      Text(
                        AppText.showingListOfAllAccounts,
                        style: context.bodySmall.copyWith(
                          fontSize: ResponsiveHelper.fontSize(14),
                        ),
                      ),

                      SizedBox(height: ResponsiveHelper.spacing(12)),

                      CustomContainer(
                        borderColor: AppColors.primaryShade,
                        backgroundColor: AppColors.primaryShade100,
                        vertical: ResponsiveHelper.height(8),
                        horizontal: ResponsiveHelper.width(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Card(
                                  color: AppColors.blueGrey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      ResponsiveHelper.borderRadius(4),
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: ResponsiveHelper.height(25),
                                    width: ResponsiveHelper.width(25),
                                    child: Center(
                                      child: Text(
                                        AppText.eh,
                                        style: context.bodySmall.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: ResponsiveHelper.fontSize(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: ResponsiveHelper.width(4)),
                                SizedBox(
                                  width: ResponsiveHelper.width(200), // max width for text
                                  child: Text(
                                    "360 Degrees Markets",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.titleSmall.copyWith(
                                      fontSize: ResponsiveHelper.fontSize(14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            _buildCustomRadio(true),
                          ],
                        ),
                      ),

                      SizedBox(height: ResponsiveHelper.spacing(12)),

                      SizedBox(
                        width: double.infinity,
                        height: ResponsiveHelper.height(48),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            AppText.selectBroker,
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Text(
            "add account",
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(16),
            ),
          ),
        ),
      ),
    );
  }

  /// Custom Radio ==========================================
  Widget _buildCustomRadio(bool isSelected) {
    return Container(
      height: ResponsiveHelper.height(24),
      width: ResponsiveHelper.width(24),
      padding: EdgeInsets.all(ResponsiveHelper.padding(3)),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.greySwitch,
          width: ResponsiveHelper.width(2),
        ),
      ),
      child: isSelected
          ? Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.primary : AppColors.greySwitch,
        ),
      )
          : null,
    );
  }
}
