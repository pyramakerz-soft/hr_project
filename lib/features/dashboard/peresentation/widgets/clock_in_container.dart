import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/widgets/big_btn.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_response.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/clock_dialog/clock_dialog_widget.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/loading_indicater.dart';

class ClockContainer extends StatefulWidget {
  const ClockContainer({
    super.key,
    required this.user,
    required this.onSuccess,
    required this.onFailure,
    this.isCheckedIn = true,
    this.duration,
    this.clockInTime,
    required this.onClockOut,
  });
  final User user;
  final void Function({required Clock? workingData}) onSuccess;
  final void Function() onFailure;
  final bool isCheckedIn;
  final String? duration;
  final DateTime? clockInTime;
  final Future<void> Function() onClockOut;

  @override
  State<ClockContainer> createState() => _ClockContainerState();
}

class _ClockContainerState extends State<ClockContainer> {
  bool _isLoading = false;

  void _setClockOutButtonBusy() {
    setState(() {
      _isLoading = true;
    });
  }

  void _setClockOutButtonReady() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String formattedDate = DateFormat('MMM d, yyyy').format(date);
    return Container(
      padding: REdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.mainColorFaded, width: 3)),
      child: widget.isCheckedIn
          ? _buildClockInColumn(formattedDate, context)
          : _buildClockOutColumn(formattedDate, context),
    );
  }

  Widget _buildClockOutColumn(String formattedDate, BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildClockInTitle(),
            _buildClockInTime(),
          ],
        ),
        10.toSizedBox,
        Row(
          children: [
            _buildCurrentDate(formattedDate),
            _buildUserPosition(),
          ],
        ),
        10.toSizedBox,
        _buildClockOutButton(context),
        10.toSizedBox,
        ClockedInTimer()
      ],
    );
  }

  Widget _buildClockInTime() {
    return DateFormat('hh:mm a')
        .format(widget.clockInTime ?? DateTime.now())
        .toSubTitle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: AppColors.grey,
        );
  }

  Widget _buildClockInTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check_circle,
            color: AppColors.mainColor.withOpacity(0.8), size: 30),
        10.toSizedBox,
        'Clock In'.toSubTitle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: AppColors.black,
        )
      ],
    );
  }

  Widget _buildClockInColumn(String formattedDate, BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildCurrentDate(formattedDate),
            _buildUserPosition(),
          ],
        ),
        20.toSizedBox,
        _buildClockInButton(context),
      ],
    );
  }

  Widget _buildClockOutButton(BuildContext context) {
    return _isLoading
        ? const LoadingIndicatorWidget()
        : MainBtn(
            margin: 0,
            fun: () async {
              _setClockOutButtonBusy();
              await widget.onClockOut().whenComplete(() {
                _setClockOutButtonReady();
                widget.onSuccess(workingData: null);
              });
            },
            txt: 'Clock Out',
            color: AppColors.negativeRed,
          );
  }

  Widget _buildClockInButton(BuildContext context) {
    return MainBtn(
      margin: 0,
      fun: () {
        showDialog(
            context: context,
            builder: (context) => ClockInDialog(
                  user: widget.user,
                  onSuccess: widget.onSuccess,
                  onFailure: widget.onFailure,
                ));
      },
      txt: 'Clock In',
      color: AppColors.mainColor,
    );
  }

  Widget _buildUserPosition() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.user.roleName != null
              ? widget.user.roleName!.toSubTitle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                )
              : const SizedBox(),
          'Position'.toSubTitle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentDate(String formattedDate) {
    return Expanded(
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
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}

class ClockedInTimer extends StatelessWidget {
  const ClockedInTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          'You are Clocked in'.toSubTitle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: AppColors.grey,
          ),
          VerticalDivider(
            color: AppColors.black,
          ),
          '00:00:00'.toSubTitle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
