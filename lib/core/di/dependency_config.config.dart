// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pyramakerz_atendnace/auth/data/remote_data_source/remote_data_source.dart'
    as _i87;
import 'package:pyramakerz_atendnace/auth/data/repo/repo.dart' as _i211;
import 'package:pyramakerz_atendnace/auth/domain/base_repo/base_repo.dart'
    as _i74;
import 'package:pyramakerz_atendnace/auth/domain/usecases/get_profile_usecase.dart'
    as _i343;
import 'package:pyramakerz_atendnace/auth/domain/usecases/login_usecase.dart'
    as _i621;
import 'package:pyramakerz_atendnace/auth/persentation/login/bloc/bloc/auth_bloc.dart'
    as _i818;
import 'package:pyramakerz_atendnace/core/app-preferances/app_preferances.dart'
    as _i963;
import 'package:pyramakerz_atendnace/core/di/register_module.dart' as _i778;
import 'package:pyramakerz_atendnace/core/dio/api_helper.dart' as _i640;
import 'package:pyramakerz_atendnace/core/network/network_info.dart' as _i615;
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
    gh.factory<_i963.AppPreferences>(() =>
        _i963.AppPreferences(sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.factory<_i640.ApiHelper>(
        () => _i640.ApiHelper(customBearerToken: gh<String>()));
    gh.singleton<_i615.NetworkInfo>(() => _i615.NetworkInfoImpl());
    gh.singleton<_i87.BaseAuthRemoteDataSource>(
        () => _i87.AuthRemoteDataSource());
    gh.singleton<_i74.BaseAuthReposetry>(() => _i211.AuthRepository(
          gh<_i87.BaseAuthRemoteDataSource>(),
          gh<_i615.NetworkInfo>(),
        ));
    gh.singleton<_i621.LoginUseCase>(
        () => _i621.LoginUseCase(gh<_i74.BaseAuthReposetry>()));
    gh.singleton<_i343.GetProfileUsecase>(
        () => _i343.GetProfileUsecase(gh<_i74.BaseAuthReposetry>()));
    gh.factory<_i818.AuthBloc>(() => _i818.AuthBloc(
          gh<_i621.LoginUseCase>(),
          gh<_i963.AppPreferences>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i778.RegisterModule {}
