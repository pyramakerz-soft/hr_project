import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:pyramakerz_atendnace/features/auth/data/models/login/login_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/login/login_request.dart';
import 'package:pyramakerz_atendnace/features/auth/domain/base_repo/base_repo.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';
import 'package:pyramakerz_atendnace/core/usecase/base_usecase.dart';

@injectable.Order(-1)
@injectable.Singleton()
class LoginUseCase extends BaseUseCase<LoginResponse, LoginRequest> {
  final BaseAuthReposetry authRepo;
  LoginUseCase(this.authRepo);

  @override
  Future<Either<Failure, LoginResponse>> call(LoginRequest parameters) {
    return authRepo.login(parameters);
  }
}
