import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';

class LoadingIndicaterWidget extends StatelessWidget {
  const LoadingIndicaterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.atendanceOrange,
      ),
    );
  }
}