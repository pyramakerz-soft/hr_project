import 'package:either_dart/either.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/login/login_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/login/login_request.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';

abstract class BaseAuthReposetry {

    Future<Either<Failure,LoginResponse>> login(LoginRequest request);
    Future<Either<Failure,User>> getProfile();

}