// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pyramakerz_atendnace/core/app-preferances/app_preferances.dart'
    as _i963;
import 'package:pyramakerz_atendnace/core/di/register_module.dart' as _i778;
import 'package:pyramakerz_atendnace/core/dio/api_helper.dart' as _i640;
import 'package:pyramakerz_atendnace/core/network/network_info.dart' as _i615;
import 'package:pyramakerz_atendnace/features/auth/data/remote_data_source/remote_data_source.dart'
    as _i441;
import 'package:pyramakerz_atendnace/features/auth/data/repo/repo.dart'
    as _i320;
import 'package:pyramakerz_atendnace/features/auth/domain/base_repo/base_repo.dart'
    as _i283;
import 'package:pyramakerz_atendnace/features/auth/domain/usecases/get_profile_usecase.dart'
    as _i615;
import 'package:pyramakerz_atendnace/features/auth/domain/usecases/login_usecase.dart'
    as _i18;
import 'package:pyramakerz_atendnace/features/auth/persentation/login/bloc/bloc/auth_bloc.dart'
    as _i13;
import 'package:pyramakerz_atendnace/features/dashboard/data/remote_data_source/remote_data_source.dart'
    as _i1059;
import 'package:pyramakerz_atendnace/features/dashboard/data/repo/repo.dart'
    as _i160;
import 'package:pyramakerz_atendnace/features/dashboard/domain/base_repo/base_repo.dart'
    as _i171;
import 'package:pyramakerz_atendnace/features/dashboard/domain/usecases/clockin_usecase.dart'
    as _i350;
import 'package:pyramakerz_atendnace/features/dashboard/domain/usecases/clockout_usecase.dart'
    as _i938;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i640.ApiHelper>(() => _i640.ApiHelper());
    gh.factory<_i963.AppPreferences>(() =>
        _i963.AppPreferences(sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.singleton<_i1059.BaseDashboardRemoteDataSource>(
        () => _i1059.DashboardRemoteDataSource());
    gh.singleton<_i615.NetworkInfo>(() => _i615.NetworkInfoImpl());
    gh.singleton<_i441.BaseAuthRemoteDataSource>(
        () => _i441.AuthRemoteDataSource(apiHelper: gh<_i640.ApiHelper>()));
    gh.singleton<_i171.BaseDashboardReposetry>(() => _i160.DashboardRepository(
          gh<_i1059.BaseDashboardRemoteDataSource>(),
          gh<_i615.NetworkInfo>(),
        ));
    gh.singleton<_i283.BaseAuthReposetry>(() => _i320.AuthRepository(
          gh<_i441.BaseAuthRemoteDataSource>(),
          gh<_i615.NetworkInfo>(),
        ));
    gh.singleton<_i350.ClockinUsecase>(
        () => _i350.ClockinUsecase(gh<_i171.BaseDashboardReposetry>()));
    gh.singleton<_i938.ClockOutUsecase>(
        () => _i938.ClockOutUsecase(gh<_i171.BaseDashboardReposetry>()));
    gh.singleton<_i18.LoginUseCase>(
        () => _i18.LoginUseCase(gh<_i283.BaseAuthReposetry>()));
    gh.singleton<_i615.GetProfileUsecase>(
        () => _i615.GetProfileUsecase(gh<_i283.BaseAuthReposetry>()));
    gh.factory<_i13.AuthBloc>(() => _i13.AuthBloc(
          gh<_i615.GetProfileUsecase>(),
          gh<_i963.AppPreferences>(),
          gh<_i18.LoginUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i778.RegisterModule {}
