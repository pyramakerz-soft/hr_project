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
import 'package:pyramakerz_atendnace/core/services/cache_service.dart' as _i989;
import 'package:pyramakerz_atendnace/core/services/location_service.dart'
    as _i984;
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
import 'package:pyramakerz_atendnace/features/clock_in/presentation/cubit/clock_in_cubit.dart'
    as _i1067;
import 'package:pyramakerz_atendnace/features/home/data/data_source/home_remote_source.dart'
    as _i378;
import 'package:pyramakerz_atendnace/features/home/data/repository/home_repository.dart'
    as _i233;
import 'package:pyramakerz_atendnace/features/home/presentation/cubit/home_cubit.dart'
    as _i883;
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
    gh.singleton<_i615.NetworkInfo>(() => _i615.NetworkInfoImpl());
    gh.singleton<_i989.CacheService>(() => _i989.CacheServiceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.singleton<_i378.HomeRemoteSource>(
        () => _i378.HomeRemoteSourceImpl(apiHelper: gh<_i640.ApiHelper>()));
    gh.singleton<_i441.BaseAuthRemoteDataSource>(
        () => _i441.AuthRemoteDataSource(apiHelper: gh<_i640.ApiHelper>()));
    gh.singleton<_i984.LocationService>(() => _i984.LocationServiceImpl());
    gh.singleton<_i233.HomeRepository>(() =>
        _i233.HomeRepositoryImpl(remoteSource: gh<_i378.HomeRemoteSource>()));
    gh.singleton<_i283.BaseAuthReposetry>(() => _i320.AuthRepository(
          remoteDataSource: gh<_i441.BaseAuthRemoteDataSource>(),
          networkInfo: gh<_i615.NetworkInfo>(),
          cacheService: gh<_i989.CacheService>(),
        ));
    gh.singleton<_i615.GetProfileUsecase>(
        () => _i615.GetProfileUsecase(gh<_i283.BaseAuthReposetry>()));
    gh.singleton<_i18.LoginUseCase>(
        () => _i18.LoginUseCase(gh<_i283.BaseAuthReposetry>()));
    gh.factory<_i883.HomeCubit>(() => _i883.HomeCubit(
          repository: gh<_i233.HomeRepository>(),
          locationService: gh<_i984.LocationService>(),
          cacheService: gh<_i989.CacheService>(),
          getProfileUsecase: gh<_i615.GetProfileUsecase>(),
        ));
    gh.factory<_i13.AuthBloc>(() => _i13.AuthBloc(
          gh<_i615.GetProfileUsecase>(),
          gh<_i963.AppPreferences>(),
          gh<_i18.LoginUseCase>(),
        ));
    gh.factory<_i1067.ClockInCubit>(() => _i1067.ClockInCubit(
          repository: gh<_i233.HomeRepository>(),
          locationService: gh<_i984.LocationService>(),
          cacheService: gh<_i989.CacheService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i778.RegisterModule {}
