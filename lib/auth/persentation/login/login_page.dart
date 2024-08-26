import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/auth/data/models/login/login_request.dart';
import 'package:pyramakerz_atendnace/auth/persentation/login/bloc/bloc/auth_bloc.dart';
import 'package:pyramakerz_atendnace/auth/persentation/login/widgets/big_btn.dart';
import 'package:pyramakerz_atendnace/auth/persentation/login/widgets/custom_text_feild_widget.dart';
import 'package:pyramakerz_atendnace/auth/persentation/login/widgets/my_snackbar.dart';
import 'package:pyramakerz_atendnace/core/app-router/app_router.gr.dart';
import 'package:pyramakerz_atendnace/core/asset_manger/asset_manger.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.mapOrNull(successlogin: (val) {
          context.router.replaceAll([const DashboardRoute()]);
          MySnackbar.showSuccess(context, 'success');
        }, errorlogin: (val) {
          MySnackbar.showError(context, val.err);
        });
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              width: double.infinity,
                              AssetManger.background,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  20.toSizedBox,
                                  Image.asset(
                                    AssetManger.pyramakerz,
                                    fit: BoxFit.cover,
                                    height: 60.h,
                                  ),
                                  20.toSizedBox,
                                  const Text('Login',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                  const Text(
                                      'Hello, please sign into your\naccount',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .3,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                    child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                30.toSizedBox,
                                Text('Email',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                10.toSizedBox,
                                CustomFormField(
                                  hintText: 'example@gmail.com',
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    final emailRegExp =
                                        RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
                                    if (!emailRegExp.hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                30.toSizedBox,
                                Text('Password',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                10.toSizedBox,
                                CustomFormField(
                                  isPassword: true,
                                  hintText: 'Enter Password',
                                  controller: passController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    }
                                    return null;
                                  },
                                ),
                                30.toSizedBox,
                                state.maybeMap(
                                  loadinglogin: (value) => const Center(
                                      child: CircularProgressIndicator()),
                                  orElse: () => BigBtn(
                                    fun: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        context.read<AuthBloc>().add(
                                            AuthEvent.login(LoginRequest(
                                                email: emailController.text,
                                                password:
                                                    passController.text)));
                                        // Handle successful form submission here
                                        // e.g., perform login action
                                      }
                                    },
                                    txt: 'Log In',
                                    color: AppColors.atendanceOrange,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
