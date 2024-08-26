import 'package:auto_route/auto_route.dart';
import 'package:pyramakerz_atendnace/auth/persentation/login/login_page.dart';
import 'package:pyramakerz_atendnace/core/app-router/app_router.gr.dart';
import 'package:pyramakerz_atendnace/core/app-router/auth_gaurd.dart';

//dart run build_runner build --delete-conflicting-outputs
//flutter packages pub run build_runner watch

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page,initial: true,guards: [AuthGuard()]),
  
      AutoRoute(page: DashboardRoute.page),

  
  ];
}
