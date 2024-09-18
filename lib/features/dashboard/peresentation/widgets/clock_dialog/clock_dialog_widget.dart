import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/core/di/dependency_config.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/animated_fade_widget.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/widgets/my_snackbar.dart';
import 'package:pyramakerz_atendnace/features/clock_in/presentation/cubit/clock_in_cubit.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_request.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_response.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/clock_dialog/clock_date_time_widget.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/clock_dialog/dialog_profile_widget.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/loading_indicater.dart';

class ClockInDialog extends StatelessWidget {
  final User user;
  final void Function({required Clock? workingData}) onSuccess;
  final void Function() onFailure;

  const ClockInDialog({
    super.key,
    required this.user,
    required this.onSuccess,
    required this.onFailure,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: REdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (context) => getIt<ClockInCubit>()..getCurrentLocation(),
          child: BlocConsumer<ClockInCubit, ClockInState>(
            listener: (context, state) {
              if (state.isError) {
                MySnackbar.showError(context, state.message!);
                Navigator.of(context).pop();
              }
              if (state.isCheckIn) {
                MySnackbar.showSuccess(context, state.message!);
                onSuccess(workingData: state.workingData);
                Navigator.of(context).pop();
              }
              if (state.isCached) {
                MySnackbar.showError(context, state.message!);
                onFailure();
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              final clockInCubit = context.read<ClockInCubit>();
              final address = state.formattedAddress;
              if (state.isGettingAddress) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const LoadingIndicatorWidget(),
                        Text(
                          'Getting Current Address',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  'Clock In'.toSubTitle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  16.toSizedBox,
                  ProfileSection(
                    user: user,
                  ),
                  16.toSizedBox,
                  if (user.isWorkFromHome == true)
                    MyDropDownList(
                      title: 'Select location type',
                      itemLabel: (e) => e.name,
                      items: LocationType.values,
                      onChanged: (item) =>
                          clockInCubit.onLocationTypeChanged(item?.name),
                    ),
                  if (user.locations.isNotEmpty)
                    MyDropDownList(
                      title: 'Select site',
                      itemLabel: (e) => e.locationName ?? '',
                      items: user.locations,
                      onChanged: clockInCubit.onSiteSelected,
                      isEnabled: state.isLocationSitesEnabled ||
                          user.isWorkFromHome == false,
                    ),
                  16.toSizedBox,
                  ClockDateTimeWidget(),
                  16.toSizedBox,
                  _buildFormattedAddress(
                      address: address ?? 'No Address Found'),
                  16.toSizedBox,
                  _DialogButtons(
                    onPositiveAction: () async {
                      await clockInCubit.checkIn();
                    },
                    onNegativeAction: () {},
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildFormattedAddress({required String address}) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 2,
          width: 50.w,
          decoration: const BoxDecoration(
            color: AppColors.mainColor,
          ),
        ),
        3.toSizedBox,
        Text(
          'Location',
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey),
          textAlign: TextAlign.center,
        ),
        Text(
          address,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          textAlign: TextAlign.start,
        ),
      ],
    );

class _DialogButtons extends StatefulWidget {
  final FutureOr<void> Function() onPositiveAction;
  final VoidCallback onNegativeAction;
  const _DialogButtons({
    super.key,
    required this.onPositiveAction,
    required this.onNegativeAction,
  });

  @override
  State<_DialogButtons> createState() => _DialogButtonsState();
}

class _DialogButtonsState extends State<_DialogButtons> {
  bool _isLoading = false;
  void _setButtonBusy() {
    setState(() {
      _isLoading = true;
    });
  }

  void _setButtonReady() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
        btn(() {
          context.router.maybePop();
        }, 'Cancel', true),
        10.toSizedBoxHorizontal,
        _isLoading
            ? Transform.scale(
                scale: 0.67, child: const LoadingIndicatorWidget())
            : btn(() {
                final futureOr = widget.onPositiveAction();
                if (futureOr is Future) {
                  _setButtonBusy();
                  futureOr.whenComplete(() {
                    _setButtonReady();
                    if (context.mounted) {
                      context.router.maybePop();
                    }
                  });
                }
              }, 'Clock In', false),
      ],
    );
  }
}

Widget btn(VoidCallback fun, String txt, bool invert) => AnimatedFadeWidget(
    onTap: fun,
    child: Container(
      padding: REdgeInsets.symmetric(vertical: invert ? 8 : 9, horizontal: 15),
      decoration: BoxDecoration(
          border: invert ? Border.all(color: AppColors.greyShadow) : null,
          color: invert ? AppColors.white : AppColors.mainColor,
          borderRadius: BorderRadius.circular(10)),
      child: txt.toSubTitle(
          color: !invert ? AppColors.white : AppColors.darkGrey,
          fontSize: 11.sp,
          fontWeight: FontWeight.w700),
    ));

class MyDropDownList<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final String Function(T) itemLabel;
  final void Function(T?)? onChanged;
  final bool isEnabled;

  const MyDropDownList({
    super.key,
    this.onChanged,
    required this.title,
    required this.items,
    required this.itemLabel,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.toSizedBox, // Assuming 'toSizedBox' is an extension for spacing

        DropdownButtonFormField<T>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.mainColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.mainColor,
              ),
            ),
            focusColor: AppColors.mainColorFaded,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.mainColor,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          value: null,
          hint: Text(title),
          items: items.map((T e) {
            return DropdownMenuItem(
              value: e,
              child: Text(itemLabel(e)),
            );
          }).toList(),
          onChanged: isEnabled ? onChanged : null,
        ),
      ],
    );
  }
}
