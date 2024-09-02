import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/login/login_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/login/login_request.dart';
import 'package:pyramakerz_atendnace/core/constants/api_constants.dart';
import 'package:pyramakerz_atendnace/core/dio/api_helper.dart';

abstract class BaseAuthRemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);

  Future<User> getProfile();
}

@injectable.Order(-3)
@injectable.Singleton(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  final ApiHelper _apiHelper;

  AuthRemoteDataSource({required ApiHelper apiHelper}) : _apiHelper = apiHelper;

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final response =
        await _apiHelper.post(path: ApiConstants.login, body: request.toMap());

    return response.fold(
      (left) => throw left,
      (right) => LoginResponse.fromJson(right.data),
    );
  }

  @override
  Future<User> getProfile() async {
    final response = await _apiHelper.get(
      path: ApiConstants.userByToken,
    );

    return response.fold(
      (left) => throw left,
      (right) => User.fromJson(right.data['User']),
    );
  }
}
