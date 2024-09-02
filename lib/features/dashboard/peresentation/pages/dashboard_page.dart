import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pyramakerz_atendnace/core/di/dependency_config.dart';

import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/bloc/bloc/auth_bloc.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/widgets/big_btn.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/widgets/my_snackbar.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_response.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/app_bar_widget.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/attendance_card.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/clock_in_container.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/loading_indicater.dart';
import 'package:pyramakerz_atendnace/features/home/presentation/cubit/home_cubit.dart';
import 'package:pyramakerz_atendnace/features/shared_widget/custom_empty_page.dart';
import 'package:pyramakerz_atendnace/features/shared_widget/custom_refresh_indicator.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, this.user});
  final User? user;
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  User? user;
  @override
  void initState() {
    user = widget.user;
    if (user == null) {
      context.read<AuthBloc>().add(AuthEvent.getHomeData());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.maybeMap(
            orElse: () {
              //TO DO we need to make Empty page widget instead of empty Container
              return user == null
                  ? const CustomEmptyWidget(
                      emptyScreenTypes: EmptyScreenTypes.notFound)
                  : _HomeBody(user: widget.user!);
            },
            loadingLoginWithToken: (val) => const Scaffold(
                  body: LoadingIndicatorWidget(),
                ),
            // TO DO we need to make the home cubit is the one responsible for home data not the auth bloc
            getHomeDataSucceed: (val) => _HomeBody(user: val.user));
      },
    );
  }
}

class _HomeBody extends StatelessWidget {
  final User user;

  const _HomeBody({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..init(user: user)
        ..getMyClocks(),
      child: Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state.isError) {
              MySnackbar.showError(context, state.error!);
            }
          },
          builder: (context, state) {
            final homeCubit = context.read<HomeCubit>();
            final myClocks = state.myClocks;
            if (state.isLocationPermissionGranted == false) {
              return CustomEmptyWidget(
                emptyScreenTypes: EmptyScreenTypes.noLocationAccess,
                actionWidget: MainBtn(
                  fun: () async {
                    await homeCubit.askForPermission();
                  },
                  txt: 'Allow Access',
                  color: AppColors.mainColor,
                ),
              );
            }
            return SafeArea(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.toSizedBox,
                    AppBarWidget(
                      firstName: user.name,
                    ),
                    20.toSizedBox,
                    if (state.checkInStatus != null)
                      ClockContainer(
                        user: user,
                        onSuccess: homeCubit.changeCheckInStatus,
                        isCheckedIn: state.isCheckedIn,
                        onFailure: () {},
                        onClockOut: () async {
                          await homeCubit.checkOut(time: DateTime.now());
                        },
                        clockInTime:
                            _parseTimeStringToDateTime(user.clockIn ?? ''),
                      )
                    else
                      const LoadingIndicatorWidget(),
                    20.toSizedBox,
                    _buildAttendanceTitle(),
                    20.toSizedBox,
                    Expanded(
                      child: state.isGettingClocks
                          ? const LoadingIndicatorWidget()
                          : myClocks.isNotEmpty
                              ? LazyLoadScrollView(
                                  onEndOfPage: homeCubit.getMoreClocks,
                                  child: CustomRefreshIndicator(
                                    onRefresh: homeCubit.refresh,
                                    listView: ListView.separated(
                                      itemCount: myClocks.length + 1,
                                      itemBuilder: (context, index) {
                                        if (index == myClocks.length) {
                                          return _buildPaginationLoading();
                                        }
                                        final currentClock = myClocks[index];
                                        return AttendanceCard(
                                          clockHistory: currentClock,
                                        );
                                      },
                                      separatorBuilder: (_, index) =>
                                          20.toSizedBox,
                                    ),
                                  ),
                                )
                              : CustomRefreshIndicator(
                                  onRefresh: homeCubit.refresh,
                                  listView: const SingleChildScrollView(
                                    physics: AlwaysScrollableScrollPhysics(),
                                    child: CustomEmptyWidget(
                                      emptyScreenTypes:
                                          EmptyScreenTypes.emptyAttendance,
                                    ),
                                  ),
                                ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPaginationLoading() {
    return Builder(
      builder: (context) => AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: context.watch<HomeCubit>().state.isGettingMoreClocks
            ? Transform.scale(scale: 0.7, child: const LoadingIndicatorWidget())
            : const SizedBox(),
      ),
    );
  }

  DateTime _parseTimeStringToDateTime(String timeString) {
    DateFormat timeFormat = DateFormat("HH:mm:ss");
    try {
      DateTime dateTime = timeFormat.parse(timeString);
      return dateTime;
    } catch (e) {
      return DateTime.now();
    }
  }

  Widget _buildAttendanceTitle() {
    return Row(
      children: [
        'Attendance List'.toSubTitle(
            fontWeight: FontWeight.w700, fontSize: 24, color: AppColors.black),
        const Spacer(),
      ],
    );
  }
}
