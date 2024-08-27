import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/login/login_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/login/login_request.dart';
import 'package:pyramakerz_atendnace/features/auth/data/remote_data_source/remote_data_source.dart';
import 'package:pyramakerz_atendnace/features/auth/domain/base_repo/base_repo.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';
import 'package:pyramakerz_atendnace/core/error/server_exception.dart';
import 'package:pyramakerz_atendnace/core/network/network_info.dart';


@injectable.Order(-2)
@injectable.Singleton(as: BaseAuthReposetry)
class AuthRepository extends BaseAuthReposetry {
  final BaseAuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepository(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest request)async {
      if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.login(request);
        return Right(res);
      } on ServerException catch (e) {
        return Left(
          Failure(
            message: e.errorMessageModel.message.toString(),
            statusCode: e.errorMessageModel.statusCode,
          ),
        );
      }
    } else {
      return const Left(Failure(message: noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, User>> getProfile() async{
   if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getProfile();
        return Right(res);
      } on ServerException catch (e) {
        return Left(
          Failure(
            message: e.errorMessageModel.message.toString(),
            statusCode: e.errorMessageModel.statusCode,
          ),
        );
      }
    } else {
      return const Left(Failure(message: noInternetConnection));
    }
  }}