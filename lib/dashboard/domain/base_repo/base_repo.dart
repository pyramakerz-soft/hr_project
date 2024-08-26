import 'package:either_dart/either.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';
import 'package:pyramakerz_atendnace/dashboard/data/models/clock_models/clock_request.dart';
import 'package:pyramakerz_atendnace/dashboard/data/models/clock_models/clock_response.dart';

abstract class BaseDashboardReposetry{


  Future<Either<Failure,ClockResponse>>  clockIn(ClockRequest request);
Future<Either<Failure,ClockResponse>>  clockOut(ClockRequest request);
}