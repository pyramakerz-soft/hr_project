import 'package:flutter/material.dart';
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
              if (clockHistory.date != null)
                (clockHistory.date!).toSubTitle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                ),
              10.toSizedBox,
              if (clockHistory.day != null)
                (clockHistory.day!).toSubTitle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.black,
                ),
              Row(
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
