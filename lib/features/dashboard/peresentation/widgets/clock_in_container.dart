import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/widgets/big_btn.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/clock_dialog/clock_dialog_widget.dart';

class ClockContainer extends StatelessWidget {
  const ClockContainer({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String formattedDate = DateFormat('MMM d, yyyy').format(date);
    return Container(
      padding: REdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.atendanceOrangeFaded, width: 3)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formattedDate.toSubTitle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    'Date'.toSubTitle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.atendanceGreyDark,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    user.roleName.toSubTitle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    'Position'.toSubTitle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.atendanceGreyDark,
                    ),
                  ],
                ),
              ),
            ],
          ),
          20.toSizedBox,
          MainBtn(
            margin: 0,
            fun: () {
                            showDialog(
                context: context,
                builder: (context) => ClockInDialog(user: user,),
              );

            },
            txt: 'Clock In',
            color: AppColors.atendanceOrange,
          ),
        ],
      ),
    );
  }
}
