import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gary_goodger/core/routes/app_routes.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/account_appbar_row_widget.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/performance_card.dart';
import 'package:gary_goodger/features/dashboard_account/presentation/widgets/state_card.dart';
import 'package:gary_goodger/share/widgets/custom_appbar/custom_appbar_container.dart';
import 'package:gary_goodger/share/widgets/custom_container/custom_container.dart';
import 'package:gary_goodger/share/widgets/custom_image/custom_image.dart';
import 'package:gary_goodger/utils/app_assets/app_assets.dart';
import 'package:gary_goodger/utils/app_colors/app_colors.dart';
import 'package:gary_goodger/utils/app_text/app_strings.dart';
import 'package:gary_goodger/utils/extension/base_extension.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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

          ///account header section==================================================
          SliverToBoxAdapter(
            child: CustomContainer(
              margin: EdgeInsets.symmetric(horizontal: 16),
              backgroundColor: AppColors.greyShade,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAccountHeaderRow(
                        context,
                        imagePath: AppAssets.nameAccountDashboard,
                        title: AppText.name,
                        subTitle: AppText.mt4104392,
                      ),

                      _buildAccountHeaderRow(
                        context,
                        imagePath: AppAssets.typeAccountDashboard,
                        title: AppText.type,
                        subTitle: AppText.mt4104392,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAccountHeaderRow(
                        context,
                        imagePath: AppAssets.brokerAccountDashboard,
                        title: AppText.broker,
                        subTitle: AppText.mt4104392,
                      ),
                      _buildAccountHeaderRow(
                        context,
                        imagePath: AppAssets.platformAccountDashboard,
                        title: AppText.platform,
                        subTitle: AppText.mt4104392,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// 2. upgrade overview win p/l rate view===============================================
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),

                  SizedBox(height: 24.h),

                  SizedBox(height: 12.h),

                  /// graph chart===================================================================
                  PerformanceCard(),

                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),

          ///key matrics card gridview=======================================================================
          SliverToBoxAdapter(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppText.keyMetrics, style: context.bodyLarge),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (context, index) {
                        return _buildKeyMatricsCard(context);
                      },
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

  ///account header row method===========================================
  Row _buildAccountHeaderRow(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String subTitle,
  }) {
    return Row(
      children: [
        CustomImage(imageSrc: imagePath),
        SizedBox(width: 4.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.bodySmall),

            Text(subTitle, style: context.titleSmall),
          ],
        ),
      ],
    );
  }

  ///key matrics card=======================================================================
  CustomContainer _buildKeyMatricsCard(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.primaryShade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "status", // ← fixed + %
            style: context.bodySmall.copyWith(fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 24.h),
          Text(
            "\$32343", // ← fixed + %
            style: context.bodyLarge,
          ),

          SizedBox(height: 4.h),

          Row(
            children: [
              Text(
                "+2.1%", // ← fixed + %
                style: context.bodySmall.copyWith(color: AppColors.primary),
              ),
              CustomImage(imageSrc: AppAssets.topArrow),
            ],
          ),
        ],
      ),
    );
  }

  /// helper methode section===================================================================================

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

              Text(AppText.account, style: context.bodyMedium),

              Spacer(),
              // Notification and Menu
              CustomImage(imageSrc: AppAssets.filter),
              SizedBox(width: 16.w),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.addAccountScreen);
                },
                child: CustomImage(imageSrc: AppAssets.add),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          AccountAppbarRowWidget(),
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
              CustomImage(imageSrc: AppAssets.filter),
              SizedBox(width: 16.w),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.addAccountScreen);
                },
                child: CustomImage(imageSrc: AppAssets.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SelectAccountTitleWidget extends StatelessWidget {
  const SelectAccountTitleWidget({
    super.key,
    required this.icon,
    required this.title,
    this.titleColor,
    this.iconColor,
  });

  final String icon;
  final String title;
  final Color? titleColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomImage(imageSrc: icon),
      title: Text(
        title,
        style: context.bodyMedium.copyWith(
          color: titleColor ?? AppColors.black,
        ),
      ),
      subtitle: Text(
        AppText.showingListOfAllAccounts,

        style: context.bodySmall,
      ),
      trailing: CustomImage(imageSrc: AppAssets.arrowFront),
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
