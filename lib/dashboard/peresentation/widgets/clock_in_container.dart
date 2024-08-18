import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/auth/persentation/login/widgets/big_btn.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';

class ClockContainer extends StatelessWidget {
  const ClockContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return      Container(
                padding: REdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: AppColors.atendanceOrangeFaded, width: 3)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              'Aug 13, 2024'.toSubTitle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              'Date'.toSubTitle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: AppColors.atendanceGreyDark,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              'Senior UX/UI Designer'.toSubTitle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              'Position'.toSubTitle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: AppColors.atendanceGreyDark,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    20.toSizedBox,
                    BigBtn(
                      margin: 0,
                      fun: () {},
                      txt: 'Clock In',
                      color: AppColors.atendanceOrange,
                    ),
                  ],
                ),
              );
  }
}