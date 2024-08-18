import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pyramakerz_atendnace/auth/persentation/login/widgets/big_btn.dart';
import 'package:pyramakerz_atendnace/core/asset_manger/asset_manger.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/dashboard/peresentation/widgets/clock_in_container.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.toSizedBox,
              Row(
                children: [
                  SvgPicture.asset(AssetManger.menu),
                  10.toSizedBoxHorizontal,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Hi, Aya Atiya'.toSubTitle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      'Good Morning'.toSubTitle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.atendanceGreyDashboard,
                      ),
                    ],
                  ),
                ],
              ),
              20.toSizedBox,
              ClockContainer(),
              20.toSizedBox,
              Row(
                children: [
                  'Attendance List'.toSubTitle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: AppColors.atendanceBlack),
                  Spacer(),
                  'See all'.toSubTitle(
                      color: AppColors.atendanceOrange,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)
                ],
              ),
              20.toSizedBox,
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.atendanceOrange,
                      ),
                    ),
                    20.toSizedBox,
                    Expanded(
                      // Using Expanded here to allow checkCol widgets to take available space
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'January 28th 2024'.toSubTitle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.atendanceBlack,
                          ),
                          10.toSizedBox,
                          'Wednesday'.toSubTitle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.atendanceBlack,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: checkCol('Check in', '07:56:21'),
                              ),
                              Expanded(
                                child: checkCol('Checkout', '07:56:21'),
                              ),
                              Expanded(
                                child: checkCol('Work hours', '07:56:21'),
                              ),
                            ],
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
      ),
    );
  }

  Widget checkCol(String header, String time) => Column(
        children: [
          header.toSubTitle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColors.atendanceGrey1),
          time.toSubTitle(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black)
        ],
      );
}
