import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';

class ClockDateTimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current date and time
    final dateTime = DateTime.now();

    // Format the date and time
    final String formattedDate = DateFormat('MMM d, yyyy').format(dateTime);
    final String formattedTime = DateFormat('h:mm a').format(dateTime);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 2,
              width: 30.w,
              decoration: BoxDecoration(
                color: AppColors.atendanceOrange,
              ),
            ),
            3.toSizedBox,
            Text('Date',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.atendanceGreyDashboard,
                    fontSize: 12.sp)),
            Text(
              formattedDate,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 2,
              width: 30.w,
              decoration: BoxDecoration(
                color: AppColors.atendanceOrange,
              ),
            ),
            3.toSizedBox,
            Text('Time',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.atendanceGreyDashboard,
                    fontSize: 12.sp)),
            Text(
              formattedTime,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
