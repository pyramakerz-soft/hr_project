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
        TitleIndicator(title: 'Date', description: formattedDate),
        TitleIndicator(title: 'Time', description: formattedTime),
      ],
    );
  }
}

class TitleIndicator extends StatelessWidget {
  const TitleIndicator({
    super.key,
    required this.title,
    this.description,
  });
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 2,
          width: 30.w,
          decoration: const BoxDecoration(
            color: AppColors.mainColor,
          ),
        ),
        3.toSizedBox,
        Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.darkGrey,
                fontSize: 12.sp)),
        description != null
            ? Text(
                description!,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              )
            : const SizedBox(),
      ],
    );
  }
}
