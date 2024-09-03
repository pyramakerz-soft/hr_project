import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pyramakerz_atendnace/core/di/dependency_config.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/widgets/my_snackbar.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_history/clock_history.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/attendance_card.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/loading_indicater.dart';
import 'package:pyramakerz_atendnace/features/home/presentation/cubit/home_cubit.dart';
import 'package:pyramakerz_atendnace/features/shared_widget/custom_empty_page.dart';
import 'package:pyramakerz_atendnace/features/shared_widget/custom_refresh_indicator.dart';

class AttendancePage extends StatelessWidget {
  final User user;
  const AttendancePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocProvider(
        create: (context) => getIt<HomeCubit>()
          ..init(user: user)
          ..getMyClocks(),
        child: BlocConsumer<HomeCubit, HomeState>(builder: (context, state) {
          final homeCubit = context.read<HomeCubit>();
          final myClocks = state.myClocks;
          return state.isGettingClocks
              ? const LoadingIndicatorWidget()
              : myClocks.isNotEmpty
                  ? _buildAttendanceList(homeCubit, myClocks)
                  : _buildEmptyPage(homeCubit, context, state);
        }, listener: (context, state) {
          if (state.isError) {
            MySnackbar.showError(context, state.message ?? '');
          }
        }),
      ),
    );
  }

  Widget _buildAttendanceList(
      HomeCubit homeCubit, List<ClockHistory> myClocks) {
    return LazyLoadScrollView(
      onEndOfPage: homeCubit.getMoreClocks,
      child: CustomRefreshIndicator(
        onRefresh: homeCubit.refresh,
        listView: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListView.separated(
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
                  )),
        ),
      ),
    );
  }

  Widget _buildEmptyPage(
      HomeCubit homeCubit, BuildContext context, HomeState state) {
    return CustomRefreshIndicator(
      onRefresh: homeCubit.refresh,
      listView: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: CustomEmptyWidget(
            emptyScreenTypes: EmptyScreenTypes.emptyAttendance,
            description: state.message,
          ),
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

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: 'Attendance List'.toSubTitle(
        fontSize: 18.sp,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      elevation: 2,
    );
  }
}
