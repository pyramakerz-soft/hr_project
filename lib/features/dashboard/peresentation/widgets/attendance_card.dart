import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_history/clock_history.dart';

class AttendanceCard extends StatefulWidget {
  final ClockHistory clockHistory;
  const AttendanceCard({super.key, required this.clockHistory});

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIndicator(),
        20.toSizedBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDate(),
                  10.toSizedBox,
                  if (widget.clockHistory.day != null)
                    (widget.clockHistory.day!).toSubTitle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.black,
                    ),
                ],
              ),
              widget.clockHistory.otherClocks.isEmpty || !_isExpanded
                  ? _buildChecksRow(
                      clockIn: widget.clockHistory.clockIn,
                      clockOut: widget.clockHistory.clockOut,
                      totalHours: widget.clockHistory.totalHours)
                  : SizedBox(
                      height: 150,
                      child: ListView.separated(
                          itemBuilder: (context, index) => _buildChecksRow(
                              clockIn: widget
                                  .clockHistory.otherClocks[index].clockIn,
                              clockOut: widget
                                  .clockHistory.otherClocks[index].clockOut,
                              totalHours: widget
                                  .clockHistory.otherClocks[index].totalHours),
                          separatorBuilder: (_, index) => 10.toSizedBox,
                          itemCount: widget.clockHistory.otherClocks.length),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChecksRow(
      {required String? clockIn,
      required String? clockOut,
      required String? totalHours}) {
    return Row(
      children: [
        if (widget.clockHistory.clockIn != null)
          Expanded(
            child: checkCol('Check in', widget.clockHistory.clockIn!),
          ),
        if (widget.clockHistory.clockOut != null)
          Expanded(
            child: checkCol('Checkout', widget.clockHistory.clockOut!),
          ),
        if (widget.clockHistory.totalHours != null)
          Expanded(
            child: checkCol('Work hours', widget.clockHistory.totalHours!),
          ),
      ],
    );
  }

  Row _buildDate() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      widget.clockHistory.date != null
          ? (widget.clockHistory.date!).toSubTitle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColors.black,
            )
          : const SizedBox(),
      widget.clockHistory.otherClocks.isNotEmpty
          ? IconButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              icon: _isExpanded
                  ? const Icon(Icons.expand_less_outlined,
                      color: AppColors.mainColor)
                  : const Icon(Icons.expand_more_outlined,
                      color: AppColors.mainColor))
          : const SizedBox(),
    ]);
  }

  Widget _buildIndicator() {
    return Container(
      width: 8,
      height: _isExpanded ? 150 : 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.mainColor,
      ),
    );
  }

  Widget checkCol(String header, String time) => Column(
        children: [
          header.toSubTitle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: AppColors.greyShadow),
          time.toSubTitle(
              fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black)
        ],
      );
}
