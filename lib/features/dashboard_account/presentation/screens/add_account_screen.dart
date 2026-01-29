import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(AppText.selectAccount, style: context.bodyLarge),

                      const SizedBox(height: 4),

                      Text(
                        AppText.showingListOfAllAccounts,
                        style: context.bodySmall,
                      ),

                      SizedBox(height: 12.h),

                      CustomContainer(
                        borderColor: AppColors.primaryShade,
                        backgroundColor: AppColors.primaryShade100,
                        vertical: 8.h,
                        horizontal: 8.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Card(
                                  color: AppColors.blueGrey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: SizedBox(
                                    height: 25.h, // adjust
                                    width: 25.w, // adjust
                                    child: Center(
                                      child: Text(
                                        AppText.eh,
                                        style: context.bodySmall.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "360 Degrees Markets",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.titleSmall,
                                ),
                              ],
                            ),
                            _buildCustomRadio(true),
                          ],
                        ),
                      ),

                      SizedBox(height: 12.h),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(AppText.selectBroker),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Text("add account"),
        ),
      ),
    );
  }

  ///radio==========================================
  Widget _buildCustomRadio(bool isSelected) {
    return Container(
      height: 24,
      width: 24,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.greySwitch,
          width: 2,
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
