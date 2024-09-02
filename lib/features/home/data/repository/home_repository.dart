import 'package:injectable/injectable.dart' as injectable;
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_history/clock_history.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_request.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_response.dart';
import 'package:pyramakerz_atendnace/features/home/data/data_source/home_remote_source.dart';

abstract class HomeRepository {
  Future<Clock> checkIn({required ClockRequest request});
  Future<void> checkOut({required ClockRequest request});
  Future<ClockHistoryResponse> getMyClocks({int page = 1});
}

@injectable.Order(-2)
@injectable.Singleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteSource _remoteSource;
  HomeRepositoryImpl({required HomeRemoteSource remoteSource})
      : _remoteSource = remoteSource;
  @override
  Future<Clock> checkIn({required ClockRequest request}) async {
    return _remoteSource.checkIn(request: request);
  }

  @override
  Future<void> checkOut({required ClockRequest request}) async {
    return _remoteSource.checkOut(request: request);
  }

  @override
  Future<ClockHistoryResponse> getMyClocks({int page = 1}) {
    return _remoteSource.getMyClocks(page: page);
  }
}
