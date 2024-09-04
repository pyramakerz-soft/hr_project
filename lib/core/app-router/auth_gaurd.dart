import 'package:auto_route/auto_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';
import 'package:pyramakerz_atendnace/features/auth/domain/usecases/get_profile_usecase.dart';
import 'package:pyramakerz_atendnace/core/app-preferances/app_preferances.dart';
import 'package:pyramakerz_atendnace/core/app-router/app_router.gr.dart';
import 'package:pyramakerz_atendnace/core/di/dependency_config.dart';
import 'package:pyramakerz_atendnace/core/usecase/base_usecase.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    final AppPreferences pref = getIt<AppPreferences>();
    if (pref.getToken() != null) {
      final usecase = getIt<GetProfileUsecase>();
      final res = await usecase(const NoParameters());
      res.fold((l) {
        if(l.message==noInternetConnection){
        resolver.redirect( DashboardRoute(user: null));

        }else{
  Fluttertoast.showToast(msg: l.message);
        resolver.next(true);
        }
      
      }, (r) {
        resolver.redirect( DashboardRoute(user: r));
      });
    } else {
      resolver.next(true);
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      //   resolver.redirect(
      //     LoginRoute(onResult: (success) {
      //       // if success == true the navigation will be resumed
      //       // else it will be aborted
      //       resolver.next(success);
      //     },
      //   );
      // );
    }
  }
}
