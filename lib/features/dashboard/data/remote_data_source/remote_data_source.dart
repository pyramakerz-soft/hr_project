import 'package:injectable/injectable.dart' as injectable;
import 'package:pyramakerz_atendnace/core/constants/api_constants.dart';
import 'package:pyramakerz_atendnace/core/dio/api_helper.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_request.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_response.dart';

abstract class BaseDashboardRemoteDataSource {


Future<ClockResponse>  clockIn(ClockRequest request);
Future<ClockResponse>  clockOut(ClockRequest request);

}


@injectable.Order(-3)
@injectable.Singleton(as: BaseDashboardRemoteDataSource)
class DashboardRemoteDataSource extends BaseDashboardRemoteDataSource {
  @override
  Future<ClockResponse> clockIn(ClockRequest request) async{
    final response = await ApiHelper().post(
      path:
          ApiConstants.clockin,
          body: request.toMap()
    );

    return response.fold(
      (left) => throw left,
      (right) => ClockResponse.fromJson(right.data),
    );
  }

  @override
  Future<ClockResponse> clockOut(ClockRequest request)async {
   final response = await ApiHelper().post(
      path:
          ApiConstants.clockout,
          body: request.toMap()
    );

    return response.fold(
      (left) => throw left,
      (right) => ClockResponse.fromJson(right.data),
    );
  }

}