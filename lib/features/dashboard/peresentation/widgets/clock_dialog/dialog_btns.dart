import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/animated_fade_widget.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';

class DialogBtns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        btn(() {
          context.router.maybePop();
        }, 'Cancel', true),
        10.toSizedBoxHorizontal,
        btn(() {
          context.router.maybePop();
        }, 'Clock In', false),
      ],
    );
  }
}

Widget btn(VoidCallback fun, String txt, bool invert) => AnimatedFadeWidget(
    onTap: fun,
    child: Container(
      padding: REdgeInsets.symmetric(vertical: invert ? 8 : 9, horizontal: 15),
      decoration: BoxDecoration(
          border: invert ? Border.all(color: AppColors.atendanceGrey1) : null,
          color: invert ? AppColors.white : AppColors.atendanceOrange,
          borderRadius: BorderRadius.circular(10)),
      child: txt.toSubTitle(
          color: !invert ? AppColors.white : AppColors.atendanceGreyDashboard,
          fontSize: 11,
          fontWeight: FontWeight.w700),
    ));
