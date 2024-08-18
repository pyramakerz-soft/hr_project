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
    return this;
  }
}

class _$RegisterModule extends _i778.RegisterModule {}
