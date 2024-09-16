import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_history/clock_history.dart';

class AttendanceCard extends StatelessWidget {
  final ClockHistory clockHistory;
  const AttendanceCard({super.key, required this.clockHistory});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIndicator(),
        20.toSizedBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDate(),
                  10.toSizedBox,
                  if (clockHistory.day != null)
                    (clockHistory.day!).toSubTitle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.black,
                    ),
                ],
              ),
              _buildChecksRow(
                  clockIn: clockHistory.clockIn,
                  clockOut: clockHistory.clockOut,
                  totalHours: clockHistory.totalHours)
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChecksRow(
      {required String? clockIn,
      required String? clockOut,
      required String? totalHours}) {
    return Row(
      children: [
        if (clockHistory.clockIn != null)
          Expanded(
            child: checkCol('Check in', clockHistory.clockIn!),
          ),
        if (clockHistory.clockOut != null)
          Expanded(
            child: checkCol('Checkout', clockHistory.clockOut!),
          ),
        if (clockHistory.totalHours != null)
          Expanded(
            child: checkCol('Work hours', clockHistory.totalHours!),
          ),
      ],
    );
  }

  Row _buildDate() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      clockHistory.date != null
          ? (clockHistory.date!).toSubTitle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColors.black,
            )
          : const SizedBox(),
    ]);
  }

  Widget _buildIndicator() {
    return Container(
      width: 8,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.mainColor,
      ),
    );
  }

  Widget checkCol(String header, String time) => Column(
        children: [
          header.toSubTitle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: AppColors.greyShadow),
          time.toSubTitle(
              fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black)
        ],
      );
}
