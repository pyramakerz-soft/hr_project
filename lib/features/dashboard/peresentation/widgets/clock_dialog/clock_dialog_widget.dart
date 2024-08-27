import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/clock_dialog/address_widget.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/clock_dialog/clock_date_time_widget.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/clock_dialog/dialog_btns.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/clock_dialog/dialog_profile_widget.dart';

class ClockInDialog extends StatelessWidget {
  final User user;

  const ClockInDialog({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            'Clock In'.toSubTitle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
            16.toSizedBox,
            ProfileSection(
              user: user,
            ),
            16.toSizedBox,
            SiteSelector(),
            16.toSizedBox,
            ClockDateTimeWidget(),
            16.toSizedBox,
            AddressWidget(latitude: 31.2001, longitude: 29.9187),
            16.toSizedBox,
            DialogBtns(),
          ],
        ),
      ),
    );
  }
}

class SiteSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select the site',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
        8.toSizedBox,
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: [
            DropdownMenuItem(child: Text('Choose'), value: 'choose'),
            // Add more DropdownMenuItems here if needed
          ],
          onChanged: (value) {},
        ),
      ],
    );
  }
}
