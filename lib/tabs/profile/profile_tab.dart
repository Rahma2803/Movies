import 'package:flutter/material.dart';
import 'package:movies/tabs/profile/history.dart';
import 'package:movies/tabs/profile/watch_list.dart';
import 'package:movies/utitities/app_assets.dart';
import 'package:movies/utitities/app_colors.dart';
import 'package:movies/utitities/app_routes.dart';
import 'package:movies/utitities/app_styles.dart';
import 'package:movies/utitities/conext_extentions.dart';
import 'package:movies/widgets/custome_button.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          // Top profile container
          Container(
            padding: EdgeInsets.only(
              left: 0.055 * context.w,
              right:0.055 * context.w,
              top: 0.088 * context.h,
              bottom: 0.01*context.h
            ),
            color: AppColors.grey,
            width: double.infinity,
            child: Column(
              spacing: 0.024*context.h,
              children: [
                /// Profile info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 0.024 * context.h,

                      children: [
                        Image.asset(AppAssets.boy2),
                        Text(
                          "John Safwat",
                          style: AppStyles.interSemiBold20White,
                        ),
                      ],
                    ),
                    Column(
                      spacing: 0.021*context.h,
                      children: [
                        Text("12", style: AppStyles.robotoBold36White),
                        Text("Wish List", style: AppStyles.robotoBold24White),
                      ],
                    ),
                    Column(
                      spacing: 0.021*context.h,
                      children: [
                        Text("10", style: AppStyles.robotoBold36White),
                        Text("History", style: AppStyles.robotoBold24White),
                      ],
                    ),
                  ],
                ),

                /// buttons
                Row(
                  spacing: 0.023 * context.w,
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomeButton(
                        text: "Edit Profile",
                        onPressed: () {
                          //todo navigate to update profile
                          Navigator.pushNamed(context, AppRoutes.updateProfileRouteName);
                        },
                        backgroundColor: AppColors.yellow,
                        foregroundColor: AppColors.grey,
                        borderColor: AppColors.yellow,
                        textStyle: AppStyles.interRegular20Black,
                        isMax: true,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomeButton(
                        rightIcon: Icon(
                          Icons.exit_to_app_rounded,
                          color: AppColors.white,
                        ),
                        text: "Exit",
                        onPressed: () {},
                        backgroundColor: AppColors.red,
                        foregroundColor: AppColors.grey,
                        borderColor: AppColors.red,
                        textStyle: AppStyles.interRegular20White,
                        isMax: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    color: AppColors.grey,
                    child: TabBar(
                      dividerColor: AppColors.grey,
                      indicatorColor: AppColors.yellow,
                      labelColor: AppColors.yellow,
                      unselectedLabelColor: AppColors.white,
                      tabs: [
                        Tab(
                          icon: Icon(Icons.list),
                          text: "Watch List",
                        ),
                        Tab(
                          icon: Icon(Icons.folder),
                          text: "History",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        WatchList(),
                        History(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}