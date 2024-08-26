import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:pyramakerz_atendnace/core/error/failure.dart';
import 'package:pyramakerz_atendnace/core/error/server_exception.dart';
import 'package:pyramakerz_atendnace/core/network/network_info.dart';
import 'package:pyramakerz_atendnace/dashboard/data/models/clock_models/clock_request.dart';
import 'package:pyramakerz_atendnace/dashboard/data/models/clock_models/clock_response.dart';
import 'package:pyramakerz_atendnace/dashboard/data/remote_data_source/remote_data_source.dart';
import 'package:pyramakerz_atendnace/dashboard/domain/base_repo/base_repo.dart';

@injectable.Order(-2)
@injectable.Singleton(as: BaseDashboardReposetry)
class DashboardRepository extends BaseDashboardReposetry {
  final BaseDashboardRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DashboardRepository(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, ClockResponse>> clockIn(ClockRequest request) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.clockIn(request);
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
  Future<Either<Failure, ClockResponse>> clockOut(ClockRequest request) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.clockOut(request);
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
}
