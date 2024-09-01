import 'package:injectable/injectable.dart' as injectable;
import 'package:pyramakerz_atendnace/core/constants/api_constants.dart';
import 'package:pyramakerz_atendnace/core/dio/api_helper.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_request.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_response.dart';

abstract class HomeRemoteSource {
  Future<Clock> checkIn({required ClockRequest request});
  Future<void> checkOut({required ClockRequest request});
}

@injectable.Order(-3)
@injectable.Singleton(as: HomeRemoteSource)
class HomeRemoteSourceImpl implements HomeRemoteSource {
  final ApiHelper _apiHelper;
  HomeRemoteSourceImpl({required ApiHelper apiHelper}) : _apiHelper = apiHelper;
  @override
  Future<Clock> checkIn({required ClockRequest request}) async {
    final body = request.toMap();
    return _apiHelper
        .post(path: ApiConstants.clockIn, body: body)
        .then((response) {
      return response.fold(
          (e) => throw Failure(
              message: e.errorMessageModel.message.toString(),
              statusCode: e.errorMessageModel.statusCode),
          (r) => Clock.fromMap(r.data));
    });
  }

  @override
  Future<void> checkOut({required ClockRequest request}) async {
    try {
      // Add logging to debug the request details
      print("Attempting to check out with request: ${request.toMap()}");

      await _apiHelper.post(path: ApiConstants.clockOut, body: request.toMap());

      print("Check out request successful");
    } catch (e) {
      print("Error in checkOut: $e");
      throw Failure(message: e.toString());
    }
  }
}
