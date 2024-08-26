import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:pyramakerz_atendnace/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/auth/domain/base_repo/base_repo.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';
import 'package:pyramakerz_atendnace/core/usecase/base_usecase.dart';

@injectable.Order(-1)
@injectable.Singleton()
class GetProfileUsecase extends BaseUseCase<UserResponse, NoParameters> {
  final BaseAuthReposetry authRepo;
  GetProfileUsecase(this.authRepo);

  @override
  Future<Either<Failure, UserResponse>> call(NoParameters parameters) {
    return authRepo.getProfile();
  }
}
