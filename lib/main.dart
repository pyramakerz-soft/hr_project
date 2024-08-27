import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/login_page.dart';
import 'package:pyramakerz_atendnace/core/app-router/app_router.dart';
import 'package:pyramakerz_atendnace/core/asset_manger/app_string.dart';
import 'package:pyramakerz_atendnace/core/di/dependency_config.dart';
import 'package:pyramakerz_atendnace/my_blocs_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(); 
    runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter( );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MultiBlocProvider(
          providers: MyBlockProviders.getAllProvider(),
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (_, __) => MaterialApp.router(
           
              debugShowCheckedModeBanner: false,
              title: 'Pyra makerz Atendance',
              theme: ThemeData(
                fontFamily: AppStrings.Poppins,
              ),
              routerDelegate: appRouter.delegate(),
              routeInformationParser: appRouter.defaultRouteParser(),
              // home: TrainingSettingsPage(
              //   changeProgramModel: (User.initial()).getProgramFromUser(),
          
              // )
            ),
          ),
        );
  }
}
