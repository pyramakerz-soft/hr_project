import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';

enum EmptyScreenTypes {
  emptyAttendance,
  noLocationAccess,
  notFound,
}

extension EmptyScreenTypesExtension on EmptyScreenTypes {
  String getImagePath() {
    switch (this) {
      case EmptyScreenTypes.emptyAttendance:
        return 'assets/svgs/empty_attendance.svg';
      case EmptyScreenTypes.noLocationAccess:
        return 'assets/svgs/no_location.svg';
      case EmptyScreenTypes.notFound:
        return 'assets/svgs/not_found.svg';
    }
  }

  String getTitle() {
    switch (this) {
      case EmptyScreenTypes.emptyAttendance:
        return 'No attendance yet';
      case EmptyScreenTypes.noLocationAccess:
        return 'No Location Access';
      case EmptyScreenTypes.notFound:
        return 'Not Found';
    }
  }

  String getDescription() {
    switch (this) {
      case EmptyScreenTypes.emptyAttendance:
        return 'Please check your attendance';
      case EmptyScreenTypes.noLocationAccess:
        return 'Please enable location access';
      case EmptyScreenTypes.notFound:
        return 'Please check your internet connection';
    }
  }
}

class CustomEmptyWidget extends StatelessWidget {
  final Widget? actionWidget;
  final EmptyScreenTypes emptyScreenTypes;
  final String? description;

  const CustomEmptyWidget(
      {super.key,
      this.actionWidget,
      required this.emptyScreenTypes,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(emptyScreenTypes.getImagePath()),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              emptyScreenTypes.getTitle(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 28),
            child: Text(
              description ?? emptyScreenTypes.getDescription(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.darkGrey,
              ),
            ),
          ),
          actionWidget ?? const SizedBox(),
        ],
      ),
    );
  }
}
