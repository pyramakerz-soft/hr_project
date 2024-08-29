import 'package:flutter/material.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.mainColor,
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
                color: AppColors.black,
              ),
              10.toSizedBox,
              'Wednesday'.toSubTitle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.black,
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
    );
  }

  Widget checkCol(String header, String time) => Column(
        children: [
          header.toSubTitle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColors.greyShadow),
          time.toSubTitle(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black)
        ],
      );
}
