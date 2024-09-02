import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/login/login_request.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/bloc/bloc/auth_bloc.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/widgets/big_btn.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/widgets/custom_text_feild_widget.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/widgets/my_snackbar.dart';
import 'package:pyramakerz_atendnace/core/app-router/app_router.gr.dart';
import 'package:pyramakerz_atendnace/core/asset_manger/asset_manger.dart';
import 'package:pyramakerz_atendnace/core/extensions/screen_util_extension.dart';
import 'package:pyramakerz_atendnace/core/theme/app_colors.dart';
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/widgets/loading_indicater.dart';

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
        state.mapOrNull(successLogin: (val) {
          context.router.replaceAll([DashboardRoute()]);
        }, errorLogin: (val) {
          MySnackbar.showError(context, val.err);
        });
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.backgroundStartColor, // Start color
                  AppColors.backgroundEndColor, // End color
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Column(
              children: [
                _buildHeader(),
                _buildForm(state, context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildForm(AuthState state, BuildContext context) {
    return Expanded(
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    30.toSizedBox,
                    _buildText(text: 'Email'),
                    10.toSizedBox,
                    _buildEmailTextField(),
                    30.toSizedBox,
                    _buildText(text: 'Password'),
                    10.toSizedBox,
                    _buildPasswordTextField(),
                    30.toSizedBox,
                    state.maybeMap(
                      loadingLogin: (value) => const LoadingIndicatorWidget(),
                      orElse: () => MainBtn(
                        fun: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.read<AuthBloc>().add(AuthEvent.login(
                                LoginRequest(
                                    email: emailController.text,
                                    password: passController.text)));
                          }
                        },
                        txt: 'Log In',
                        color: AppColors.mainColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildPasswordTextField() {
    return CustomFormField(
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
    );
  }

  Widget _buildEmailTextField() {
    return CustomFormField(
      hintText: 'Enter Email',
      controller: emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        final emailRegExp = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
        if (!emailRegExp.hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildText({required String text}) {
    return Text(text,
        style: TextStyle(
            fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black));
  }

  Widget _buildHeader() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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
            const Text('Hello, please sign into your\naccount',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
