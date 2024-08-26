import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:pyramakerz_atendnace/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/auth/domain/base_repo/base_repo.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';
import 'package:pyramakerz_atendnace/core/usecase/base_usecase.dart';
import 'package:pyramakerz_atendnace/dashboard/data/models/clock_models/clock_request.dart';
import 'package:pyramakerz_atendnace/dashboard/data/models/clock_models/clock_response.dart';
import 'package:pyramakerz_atendnace/dashboard/domain/base_repo/base_repo.dart';

@injectable.Order(-1)
@injectable.Singleton()
class ClockinUsecase extends BaseUseCase<ClockResponse, ClockRequest> {
  final BaseDashboardReposetry authRepo;
  ClockinUsecase(this.authRepo);

  @override
  Future<Either<Failure, ClockResponse>> call(ClockRequest parameters) {
    return authRepo.clockIn(parameters);
  }
}
