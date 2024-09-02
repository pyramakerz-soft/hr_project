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
        // ClockedInTimer(
        //   clockInTime: widget.clockInTime ?? DateTime.now(),
        //   totalHours: _parseTimeStringToDateTime(widget.user.totalHours ?? ''),
        // )
      ],
    );
  }

  DateTime? _parseTimeStringToDateTime(String timeString) {
    DateFormat timeFormat = DateFormat("HH:mm:ss");
    try {
      DateTime dateTime = timeFormat.parse(timeString);
      return dateTime;
    } catch (e) {
      return null;
    }
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

class ClockedInTimer extends StatefulWidget {
  final DateTime
      clockInTime; // The time when the user clocked in for the current session
  final DateTime?
      totalHours; // Optional: Represents the total time already clocked in

  const ClockedInTimer({
    super.key,
    required this.clockInTime,
    this.totalHours, // Optional parameter, no 'required' keyword
  });

  @override
  State<ClockedInTimer> createState() => _ClockedInTimerState();
}

class _ClockedInTimerState extends State<ClockedInTimer> {
  late Duration
      elapsedTime; // This will store the total elapsed time as a Duration
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Initialize elapsedTime with totalHours if it's not null; otherwise, start from Duration.zero
    elapsedTime = widget.totalHours != null
        ? _durationFromDateTime(widget.totalHours!)
        : Duration.zero;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // Calculate the total elapsed time including the current clock-in session
        Duration currentSessionDuration =
            DateTime.now().difference(widget.clockInTime);

        // Add current session duration to the total elapsed time
        elapsedTime = currentSessionDuration +
            (widget.totalHours != null
                ? _durationFromDateTime(widget.totalHours!)
                : Duration.zero);
      });
    });
  }

  // Helper function to convert DateTime to Duration since epoch
  Duration _durationFromDateTime(DateTime dateTime) {
    return Duration(
        hours: dateTime.hour,
        minutes: dateTime.minute,
        seconds: dateTime.second);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

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
          _formatDuration(elapsedTime).toSubTitle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
