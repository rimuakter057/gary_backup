import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/core/routes/app_routes.dart';
import 'package:gary_goodger/features/common/presentation/widgets/custom_upgrade_button.dart';
import 'package:gary_goodger/features/common/presentation/widgets/high_insights_container.dart';
import 'package:gary_goodger/features/common/presentation/widgets/status_outline_container.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/account_title.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/performance_card.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/state_card.dart';
import 'package:gary_goodger/share/widgets/custom_appbar/custom_appbar_container.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_divider/custom_divider.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';
import 'package:get/get.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      bottomNavigationBar: _buildBottomNav(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          ///appbar=======================================================================
          const DashboardHeader(),

          /// 2. upgrade overview win p/l rate view===============================================
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),

                  ///upgrade container========================================================================
                  CustomContainer(
                    horizontal: 8,
                    vertical: 8,
                    backgroundColor: AppColors.primaryShade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              AppText.unlockProTrader,
                              style: context.bodyMedium,
                            ),
                            SizedBox(height: 4.h),
                            SizedBox(
                              height: 40.h,
                              width: 180.w,
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                AppText.advancedAnalyticsAndCopiers,
                                style: context.bodySmall,
                              ),
                            ),
                          ],
                        ),
                        CustomUpgradeButton(),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),
                  _buildSectionHeader("Overview", context),
                  SizedBox(height: 12.h),

                  /// graph chart===================================================================
                  PerformanceCard(),
                  SizedBox(height: 16.h),

                  ///insights horizontal list================================================================
                  const HorizontalStatsList(), // Middle Cards
                  ///link account navigation bottom=============================
                  SizedBox(height: 24.h),
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
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

                              // Search Bar
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Search...",
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 12),

                              // List
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return CustomContainer(
                                      margin: EdgeInsets.only(bottom: 12.h),

                                      borderColor: AppColors.boarderColor,
                                      child: AccountTile(
                                        id: "MT5-104392",
                                        broker: "IC Markets",
                                        amount: "\$1,624",
                                        status: AppText.active,
                                        statusTextColor: AppColors.primary,
                                        statusBgColor:
                                            AppColors.primaryShade100,
                                        statusBorderColor: AppColors
                                            .primary, // statusColor: Colors.orange
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // Bottom Button (Floating like)
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },

                                child: const Text(AppText.addAccount),
                              ),
                            ],
                          ),
                        ),
                        isScrollControlled: true,
                      );
                    },

                    child: _buildSectionHeader("Linked Accounts", context),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ),

          /// link account list==============================================================
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.boarderColor),
              ),

              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 4.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8,
                        ),
                        child: const AccountTile(
                          id: "MT5-104392",
                          broker: "IC Markets",
                          amount: "\$1,624",
                          status: "Pending",
                          statusTextColor: AppColors.primary,
                          statusBgColor: AppColors.primaryShade100,
                          statusBorderColor:
                              AppColors.primary, // statusColor: Colors.orange
                        ),
                      ),
                      if (index != 2) CustomDivider(),
                    ],
                  );
                },
              ),
            ),
          ),

          /// 4. copiers Section================================================================
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.accountScreen);
                    },
                    child: _buildSectionHeader(
                      AppText.copiersAccounts,
                      context,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  SizedBox(
                    height: 190.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return CustomContainer(
                          //padding: EdgeInsets.all(8),
                          width: 150.w,
                          margin: EdgeInsets.only(right: 16.w),
                          borderColor: AppColors.boarderColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Master\nAccount 2",
                                style: context.titleSmall.copyWith(
                                  color: AppColors.textBlack,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                children: [
                                  StatusOutlineContainer(
                                    statusBgColor: AppColors.primaryShade100,
                                    statusBorderColor: AppColors.primary,
                                    status: AppText.active,
                                    statusTextColor: AppColors.primary,
                                  ),
                                  SizedBox(),
                                ],
                              ),
                              SizedBox(height: 32.h),
                              CustomContainer(
                                width: 64.w,

                                horizontal: 2.w,
                                vertical: 2.h,

                                radius: 50.r,
                                backgroundColor: AppColors.orange,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomImage(
                                      imageSrc: AppAssets.masterAccountShare,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "10",
                                      style: context.titleSmall.copyWith(
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 8.h),

                  HighInsightsContainerWidget(),
                ],
              ),
            ),
          ),

          /// 5. Top Traders title text===============================================================
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  _buildSectionHeader("Top Traders", context),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // /// top traders  lis====================================================
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.boarderColor),
              ),

              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 4.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8,
                        ),
                        child: _buildTopTraderList(context),
                      ),
                      if (index != 2) CustomDivider(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// helper methode section===================================================================================

  ///top trader========================================================
  Row _buildTopTraderList(BuildContext context) {
    return Row(
      children: [
        // Trader Avatar/Rank
        CustomImage(imageSrc: AppAssets.topTraderDashboard),
        SizedBox(width: 12.w),
        // Trader Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("John Fit", style: context.titleSmall),
              Text(
                "1230 Followers",
                style: context.bodySmall.copyWith(color: AppColors.textBlack),
              ),
            ],
          ),
        ),
        // Performance Percentage
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [Text("+12.5% ", style: context.titleSmall)],
        ),
      ],
    );
  }

  /// --- Helper Methods ---==========================

  Widget _buildSectionHeader(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.bodyMedium),

        Container(
          height: 30.h,
          width: 30.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.greyShade,
          ),
          child: CustomImage(imageSrc: AppAssets.arrowFront),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF00796B),
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.copy_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: ""),
      ],
    );
  }
}

/// appbar header===============================================================

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double toolbarHeight = 100.h;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: 136.h,
      toolbarHeight: toolbarHeight,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var top = constraints.biggest.height;

          bool isCollapsed =
              top <= (MediaQuery.of(context).padding.top + toolbarHeight);

          return FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.zero,

            title: isCollapsed
                ? _buildSmallAppBar(context)
                : const SizedBox.shrink(),
            background: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: isCollapsed
                  ? const SizedBox.shrink()
                  : _buildBigAppBar(context),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBigAppBar(BuildContext context) {
    return CustomAppBarContainer(
      child: Column(
        children: [
          Row(
            children: [
              CustomImage(imageSrc: AppAssets.logo),
              Spacer(),

              Text(AppText.dashboard, style: context.bodyMedium),

              Spacer(),
              // Notification and Menu
              CustomImage(imageSrc: AppAssets.notification),
              SizedBox(width: 16.w),
              CustomImage(imageSrc: AppAssets.menu),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppText.account,
                    style: context.titleSmall.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    AppText.mt4104392,
                    style: context.bodyMedium,
                  ),
                ],
              ),
              CustomImage(imageSrc: AppAssets.dropdown),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallAppBar(BuildContext context) {
    return CustomAppBarContainer(
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  CustomImage(imageSrc: AppAssets.logo),

                  SizedBox(width: 4.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.account,
                        style: context.titleSmall.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(
                        width: 120.w,
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          AppText.mt4104392,
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 4.w),
                  CustomImage(imageSrc: AppAssets.dropdown),
                ],
              ),

              Spacer(),
              // Notification and Menu
              CustomImage(imageSrc: AppAssets.notification),
              SizedBox(width: 16.w),
              CustomImage(imageSrc: AppAssets.menu),
            ],
          ),
        ],
      ),
    );
  }
}

///chart container=====================================================================================
class ChartContainer extends StatelessWidget {
  const ChartContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0B1019),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(
          "Line Graph Area",
          style: TextStyle(color: Colors.white24, fontSize: 12.sp),
        ),
      ),
    );
  }
}

///insights state card==============================================================================================
class HorizontalStatsList extends StatelessWidget {
  const HorizontalStatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const StatCard(
            title: AppText.winRate,
            amount: '1844',
            percent: '2.1',
          );
        },
      ),
    );
  }
}
