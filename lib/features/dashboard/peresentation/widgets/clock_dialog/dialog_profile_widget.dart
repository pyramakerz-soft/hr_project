import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';

class ProfileSection extends StatelessWidget {
  final User user;

  const ProfileSection({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.whiteOpacity,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
              5.toSizedBox,
              Text(user.roleName,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.atendanceGreyDashboard)),
            ],
          ),
        ],
      ),
    );
  }
}