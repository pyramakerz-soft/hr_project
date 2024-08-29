import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: const BoxDecoration(
          color: AppColors.mainColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
