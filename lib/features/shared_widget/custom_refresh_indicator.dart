import 'package:flutter/material.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Widget listView;
  final Future<void> Function() onRefresh;
  const CustomRefreshIndicator(
      {super.key, required this.listView, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        backgroundColor: AppColors.mainColor,
        color: Colors.white,
        onRefresh: onRefresh,
        child: listView);
  }
}
