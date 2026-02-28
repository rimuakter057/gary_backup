import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/core/routes/app_routes.dart';
import 'package:gary_goodger/features/common/presentation/widgets/title_text_widget.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/custom_appbar_copier.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/master_account_card.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/radio_tile_widget.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/tab_widget.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/template_sheet_widget.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/account_title.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/custom_switch_button.dart';
import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';
import 'package:get/get.dart';

class CopierScreen extends StatefulWidget {
  const CopierScreen({super.key});

  @override
  State<CopierScreen> createState() => _CopierScreenState();
}

class _CopierScreenState extends State<CopierScreen> {
  bool isSwitched = true;
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.height(16));
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: CustomAppBarCopier(
        title: AppText.copier,
        leading: CustomImage(imageSrc: AppAssets.logo),
        actionIcon: CustomImage(imageSrc: AppAssets.add),
        onAction: () {},
      ),

      body: Column(
        children: [
          TabWidgetCopier(),
          Expanded(
            child: SingleChildScrollView(
              padding: ResponsiveHelper.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  _buildSearchBar(),
                  SizedBox(height: ResponsiveHelper.height(20)),

                  ///account tab section===========================================================================
                  TitleTextWidget(title: AppText.masterAccount),

                  /// master account tile===============================================================
                  CustomContainer(
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.boarderColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader("Enabled (03)"),
                        GestureDetector(
                          onTap: (){

                            Get.toNamed(AppRoutes.masterAccountScreen);
                          },
                          child: const MasterAccountCardAnalyzer(
                            title: "Master Account 1",
                            enabled: 7,
                            disabled: 3,
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.height(12)),
                        const MasterAccountCardAnalyzer(
                          title: "Master Account 2",
                          enabled: 7,
                          disabled: 3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.height(18)),

                  ///template tab section===========================================================================
                  gap,
                  TitleTextWidget(title: "Copier Templates"),
                  gap,

                  /// master account tile===============================================================
                  CustomContainer(

                    borderColor: AppColors.boarderColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(4, (index){
                        return Padding(
                          padding:  EdgeInsets.only(bottom:ResponsiveHelper.height(8)),
                          child: GestureDetector(
                            onTap: (){
                              Get.bottomSheet(

                                  TemplateSheetWidget()
                              );;

                            },
                            child: CustomContainer(
                              borderColor: AppColors.boarderColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppText.testTemplate,
                                    style: context.bodyMedium.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Type: Rot Multiplier   Risk Settings: 100%",
                                    style: context.bodySmall.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );


                      }),
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.height(18)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search, size: 20.sp),
        suffixIcon: Icon(Icons.mic, size: 20.sp),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
      ),
    );
  }
}
