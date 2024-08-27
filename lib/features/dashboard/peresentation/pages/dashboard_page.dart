import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pyramakerz_atendnace/core/asset_manger/asset_manger.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/extensions/string_extensions.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/bloc/bloc/auth_bloc.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/app_bar_widget.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/clock_in_container.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/loading_indicater.dart';

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
   user=widget.user;
   if(user==null){
    context.read<AuthBloc>().add(AuthEvent.loginWithToken());
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
        return state.maybeMap(orElse: () {
          return user == null ? Container() : myWid(widget.user!);
        },
        loadingLoginWithToken: (val)=>Scaffold(
          body: LoadingIndicaterWidget(),
        ),
        successLoginWithToken: (val)=>myWid(val.user)
        );
      },
    );
  }

  Widget myWid(User user) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.toSizedBox,
             AppBarWidget(firstName: user.name,),
                20.toSizedBox,
                ClockContainer(user: user,),
                20.toSizedBox,
                Row(
                  children: [
                    'Attendance List'.toSubTitle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: AppColors.atendanceBlack),
                    Spacer(),
                    'See all'.toSubTitle(
                        color: AppColors.atendanceOrange,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)
                  ],
                ),
                20.toSizedBox,
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.atendanceOrange,
                        ),
                      ),
                      20.toSizedBox,
                      Expanded(
                        // Using Expanded here to allow checkCol widgets to take available space
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            'January 28th 2024'.toSubTitle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.atendanceBlack,
                            ),
                            10.toSizedBox,
                            'Wednesday'.toSubTitle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.atendanceBlack,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: checkCol('Check in', '07:56:21'),
                                ),
                                Expanded(
                                  child: checkCol('Checkout', '07:56:21'),
                                ),
                                Expanded(
                                  child: checkCol('Work hours', '07:56:21'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget checkCol(String header, String time) => Column(
        children: [
          header.toSubTitle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColors.atendanceGrey1),
          time.toSubTitle(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black)
        ],
      );
}
