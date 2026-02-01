import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/core/routes/app_routes.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/master_account_card.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/radio_tile_widget.dart';
import 'package:gary_goodger/features/copier/presentation/widgets/tab_widget.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/account_title.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/custom_switch_button.dart';
import 'package:gary_goodger/helper/responsive_helper/responsive_helper.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
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

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Icon(Icons.grid_view_rounded, color: AppColors.primary),
        title: Text(
          "Copier",
          style: TextStyle(
            color: Colors.black,
            fontSize: ResponsiveHelper.fontSize(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.black),
          ),
          SizedBox(width: ResponsiveHelper.width(10)),
        ],
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

                  Text(
                    "Master Accounts",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: ResponsiveHelper.fontSize(16),
                    ),
                  ),
                  gap,

                  /// master account tile===============================================================
                  CustomContainer(
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.boarderColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader("Enabled (03)"),
                        const MasterAccountCardAnalyzer(
                          title: "Master Account 1",
                          enabled: 7,
                          disabled: 3,
                        ),
                        SizedBox(height: ResponsiveHelper.height(12),),
                        const MasterAccountCardAnalyzer(
                          title: "Master Account 2",
                          enabled: 7,
                          disabled: 3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.height(18),),

                  CustomContainer(
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.boarderColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader("Disabled - Monitor Existing (03)"),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.masterAccountScreen);
                          },
                          child: const MasterAccountCardAnalyzer(
                            title: "Master Account 3",
                            enabled: 7,
                            disabled: 3,
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.height(12),),
                        const MasterAccountCardAnalyzer(
                          title: "Master Account 4",
                          enabled: 7,
                          disabled: 3,
                        ),
                      ],
                    ),
                  ),



                  SizedBox(height: ResponsiveHelper.height(16)),
                  Text(
                    "slave account setting",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveHelper.fontSize(16),
                    ),
                  ),

                  ///slave account setting=======================================================================
                  ListTile(
                    leading: CustomImage(imageSrc: AppAssets.editCopier),
                    title: Text(AppText.editSlave, style: context.bodyMedium),
                    subtitle: Text(
                      AppText.descriptionWillGoHere,
                      style: context.bodySmall,
                    ),
                    trailing: CustomImage(imageSrc: AppAssets.arrowFront),
                  ),

                  /// master account slave===============================================================
                  Text(
                    "Master Accounts Slave",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: ResponsiveHelper.fontSize(16),
                    ),
                  ),
                  CustomContainer(
                    borderColor: AppColors.orange,
                    backgroundColor: AppColors.orangeShadeBg,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left Side: Text Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppText.slaveAccount,
                                style: context.bodyMedium,
                              ),
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

                  gap,

                  /// advance setting===============================================================
                  Text(
                    "advance setting",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: ResponsiveHelper.fontSize(16),
                    ),
                  ),
                  gap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppText.eurUsd, style: context.titleSmall),
                      CustomTealSwitch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                      ),
                    ],
                  ),
                  gap,

                  ///copy from account tile======================================================
                  Text(
                    "copy from account title",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: ResponsiveHelper.fontSize(16),
                    ),
                  ),
                  CustomContainer(
                    backgroundColor: AppColors.primaryShade100,
                    borderColor: AppColors.primary,
                    child: AccountTile(
                      id: "MT5-104392",
                      broker: "IC Markets",
                      amount: "\$1,624",
                      status: "active",
                      statusTextColor: AppColors.primary,
                      statusBgColor: AppColors.primaryShade100,
                      statusBorderColor:
                          AppColors.primary, // statusColor: Colors.orange
                    ),
                  ),
                  gap,

                  ///map to symbols======================================================
                  Text(
                    "map symbol",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: ResponsiveHelper.fontSize(16),
                    ),
                  ),
                  RadioTileWidget(isSelected: isSelected),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopTabs() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Color(0xFFE0E4E7),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          _tabItem("Accounts", isSelected: true),
          _tabItem("Templates"),
          _tabItem("Logs"),
        ],
      ),
    );
  }

  Widget _tabItem(String title, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
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
