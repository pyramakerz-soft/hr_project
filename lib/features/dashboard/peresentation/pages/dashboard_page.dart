import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pyramakerz_atendnace/core/attendance/presentation/attendance_page.dart';
import 'package:pyramakerz_atendnace/core/di/dependency_config.dart';

import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/animated_fade_widget.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/bloc/bloc/auth_bloc.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/widgets/big_btn.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/widgets/my_snackbar.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_history/clock_history.dart';

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
      listener: (context, state) {},
      builder: (context, state) {
        final authBloc = context.read<AuthBloc>();
        return state.maybeMap(
            getHomeDataError: (value) => Scaffold(
                  body: CustomRefreshIndicator(
                    onRefresh: () async {
                      authBloc.add(AuthEvent.getHomeData());
                    },
                    listView: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: CustomEmptyWidget(
                          emptyScreenTypes: EmptyScreenTypes.notFound,
                          description: value.err,
                        ),
                      ),
                    ),
                  ),
                ),
            orElse: () {
              return user == null
                  ? Scaffold(
                      body: CustomRefreshIndicator(
                        onRefresh: () async {
                          authBloc.add(AuthEvent.getHomeData());
                        },
                        listView: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: const CustomEmptyWidget(
                              emptyScreenTypes: EmptyScreenTypes.notFound,
                              description:
                                  'Something went wrong, please try again',
                            ),
                          ),
                        ),
                      ),
                    )
                  : CustomRefreshIndicator(
                      onRefresh: () async {
                        authBloc.add(AuthEvent.getHomeData());
                      },
                      listView: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: _HomeBody(user: widget.user!)),
                      ),
                    );
            },
            loadingLoginWithToken: (val) => const Scaffold(
                  body: LoadingIndicatorWidget(),
                ),
            // TO DO we need to make the home cubit is the one responsible for home data not the auth bloc

            getHomeDataSucceed: (val) => CustomRefreshIndicator(
                  onRefresh: () async {
                    authBloc.add(AuthEvent.getHomeData());
                  },
                  listView: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: _HomeBody(user: val.user)),
                  ),
                ));
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
              MySnackbar.showError(context, state.message!);
            }
          },
          builder: (context, state) {
            final homeCubit = context.read<HomeCubit>();
            final myClocks = state.myClocks;
            if (state.isLocationPermissionGranted == false) {
              return _buildNoLocationAccessPage(context: context);
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
                    ClockContainer(
                      user: user,
                      onSuccess: homeCubit.changeCheckInStatus,
                      isCheckedIn: state.isCheckedIn,
                      onFailure: () {},
                      onClockOut: () async {
                        final success =
                            await homeCubit.checkOut(time: DateTime.now());
                        if (!success && context.mounted) {
                          MySnackbar.showError(
                              context, 'Check Out Cached due to network issue');
                        }
                      },
                      clockInTime:
                          _parseTimeStringToDateTime(user.clockIn ?? ''),
                    ),
                    20.toSizedBox,
                    _buildAttendanceTitle(context: context),
                    20.toSizedBox,
                    _buildAttendances(state, myClocks, homeCubit, context)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAttendances(HomeState state, List<ClockHistory> myClocks,
      HomeCubit homeCubit, BuildContext context) {
    return Expanded(
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
                      separatorBuilder: (_, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(thickness: 1),
                      ),
                    ),
                  ),
                )
              : CustomRefreshIndicator(
                  onRefresh: homeCubit.refresh,
                  listView: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: CustomEmptyWidget(
                        emptyScreenTypes: EmptyScreenTypes.emptyAttendance,
                        description: state.message,
                      ),
                    ),
                  ),
                ),
    );
  }

  Widget _buildNoLocationAccessPage({required BuildContext context}) {
    final homeCubit = context.read<HomeCubit>();
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

  Widget _buildAttendanceTitle({required BuildContext context}) {
    final homeCubit = context.read<HomeCubit>();
    final state = homeCubit.state;
    return Row(
      children: [
        'Attendance List'.toSubTitle(
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
            color: AppColors.black),
        const Spacer(),
        state.myClocks.isNotEmpty
            ? AnimatedFadeWidget(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AttendancePage(
                              user: context.read<HomeCubit>().state.user!)));
                },
                child: 'See all'.toSubTitle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.mainColor),
              )
            : const SizedBox(),
      ],
    );
  }
}
