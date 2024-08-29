import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pyramakerz_atendnace/core/app-preferances/app_preferances.dart';
import 'package:pyramakerz_atendnace/core/app-router/app_router.gr.dart';
import 'package:pyramakerz_atendnace/core/asset_manger/asset_manger.dart';
import 'package:pyramakerz_atendnace/core/di/dependency_config.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/animated_fade_widget.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/login_page.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.firstName,
  });
  final String? firstName;

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeWidget(
      onTap: () {
        final apppref = getIt<AppPreferences>();
        apppref.removeToken();
        context.router.replaceAll([LoginRoute()]);
      },
      child: Row(
        children: [
          SvgPicture.asset(AssetManger.menu),
          10.toSizedBoxHorizontal,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Hi, $firstName'.toSubTitle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              'Good Morning'.toSubTitle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.darkGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
