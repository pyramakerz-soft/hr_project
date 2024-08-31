import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz_atendnace/core/app-preferances/app_preferances.dart';
import 'package:pyramakerz_atendnace/core/usecase/base_usecase.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/login/login_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/login/login_request.dart';
import 'package:pyramakerz_atendnace/features/auth/domain/usecases/get_profile_usecase.dart';
import 'package:pyramakerz_atendnace/features/auth/domain/usecases/login_usecase.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._getProfile, this._appPreferences, this._loginUseCase)
      : super(const _Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        login: (event) async => await _mapLogin(event, emit),
        getHomeData: (event) async => await _mapLoginWithToken(event, emit),
      );
    });
  }

  late User user;
  final LoginUseCase _loginUseCase;
  final GetProfileUsecase _getProfile;
  final AppPreferences _appPreferences;

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
  }

  _mapLogin(_login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loadingLogin());
    final response = await _loginUseCase(
        event.request.copyWith(serialNumber: await _getId()));
    try {
      await response.fold((l) async => emit(AuthState.errorLogin(l.message)),
          (r1) async {
        _appPreferences.saveToken(r1.token);
        emit(AuthState.successLogin(
          r1,
        ));
      });
    } catch (e) {
      emit(AuthState.getHomeDataError(e.toString()));
    }
  }

  _mapLoginWithToken(_loginWithToken event, Emitter<AuthState> emit) async {
    emit(const AuthState.loadingLoginWithToken());
    final response = await _getProfile(NoParameters());
    try {
      await response
          .fold((l) async => emit(AuthState.getHomeDataError(l.message)),
              (r1) async {
        user = r1;
        emit(AuthState.getHomeDataSucceed(
          r1,
        ));
      });
    } catch (e) {
      emit(AuthState.getHomeDataError(e.toString()));
    }
  }
}
