import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/features/common/pesentation/widgets/custom_upgrade_button.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/account_title.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/performance_card.dart';
import 'package:gary_goodger/share/widgets/custom_appbar/custom_appbar_container.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_divider/custom_divider.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:gary_goodger/utils/app_assets/app_icons.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFCFE),

      bottomNavigationBar: _buildBottomNav(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          ///appbar=======================================================================
          const DashboardHeader(),

          // 2. Main Content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  CustomContainer(
                    padding: EdgeInsets.all(8.w),
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
                  PerformanceCard(),
                  SizedBox(height: 16.h),

                  const HorizontalStatsList(), // Middle Cards

                  SizedBox(height: 24.h),
                  _buildSectionHeader("Linked Accounts", context),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ),




          SliverToBoxAdapter(
            child: Container(

                  margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: AppColors.boarderColor
                  )
              ),

              child: ListView.builder(
                  padding: EdgeInsets.zero,
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context,index){
                return Column(
                                children: [
                                  SizedBox(height: 4.h,),
                                  Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8),
                                  child: const AccountTile(id: "MT5-104392",
                                      broker: "IC Markets",
                                      amount: "\$1,624",
                                      status: "Pending",
                                     statusTextColor:  AppColors.primary,
                                    statusBgColor: AppColors.primaryShade100,
                                    statusBorderColor: AppColors.primary,                                     // statusColor: Colors.orange
                                  ),
                                ),
                                  if (index != 2)   CustomDivider(),
                
                                ]
                            );


              }),


                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemCount: accounts.length,
                //   itemBuilder: (context, index) {
                //     return Column(
                //       children: [
                //         AccountTile(
                //           id: accounts[index].id,
                //           broker: accounts[index].broker,
                //           amount: accounts[index].amount,
                //           status: accounts[index].status,
                //           statusColor: Colors.orange,
                //         ),
                //
                //         if (index != accounts.length - 1) CustomDivider(),
                //       ],
                //     );
                //   },
                // )



            ),
          ),



          // 4. Smart Insights Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  _buildSectionHeader("Smart Insights", context),
                  SizedBox(height: 12.h),
                  _buildInsightBanner(),
                ],
              ),
            ),
          ),

          // 5. Top Traders List
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: _buildSectionHeader("Top Traders", context),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => const TraderListItem(),
                childCount: 3,
              ),
            ),
          ),

          // Bottom Spacing
          SliverToBoxAdapter(child: SizedBox(height: 40.h)),
        ],
      ),
    );
  }

  // --- Helper Methods ---

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

  Widget _buildInsightBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF00897B),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Best ROI Window",
            style: TextStyle(color: Colors.white70, fontSize: 12.sp),
          ),
          Text(
            "Trade Between 08:00 - 11:00 UTC",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
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

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double toolbarHeight = 100.h;
    return SliverAppBar(
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
          return const StatCard();
        },
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.all(8),
      width: 100.w,
      margin: EdgeInsets.only(right: 12.w),
      borderColor: AppColors.boarderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImage(imageSrc: AppAssets.insightsDashboard),
          SizedBox(height: 24.h),
          Text(AppText.winRate, style: context.bodySmall),
          Text("\$1,824", style: context.bodyMedium),
          Row(
            children: [
              Text("+2.1%", style: context.bodySmall.copyWith(color: AppColors.primary)),
              CustomImage(imageSrc: AppAssets.topArrow)
            ],
          ),
        ],
      ),
    );
  }
}

class TraderListItem extends StatelessWidget {
  const TraderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          // Trader Avatar/Rank
          CircleAvatar(
            radius: 20.r,
            backgroundColor: const Color(0xFFFFD700).withOpacity(0.2),
            child: Icon(Icons.emoji_events, color: Colors.orange, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          // Trader Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Fit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  "1230 Followers",
                  style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                ),
              ],
            ),
          ),
          // Performance Percentage
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "+12.5% ",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              Icon(Icons.keyboard_arrow_right, size: 16.sp, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
