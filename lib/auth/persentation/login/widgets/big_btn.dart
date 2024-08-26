import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/core/theme/animated_fade_widget.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';

class BigBtn extends StatelessWidget {
  const BigBtn(
      {super.key,
      required this.txt,
      required this.fun,
      required this.color,
      this.margin});
  final String txt;
  final VoidCallback fun;
  final Color color;
  final double? margin;
  @override
  Widget build(BuildContext context) {
    return AnimatedFadeWidget(
      onTap: fun,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: margin ?? 20),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: color),
        child: Center(
          child: Text(txt,
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white)),
        ),
      ),
    );
  }
}
