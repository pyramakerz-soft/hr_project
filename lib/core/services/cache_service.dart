import 'dart:convert';
import 'package:injectable/injectable.dart' as injectable;
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheService {
  Future<void> cacheRequest({required ClockRequest request});
  Future<ClockRequest?> getCachedRequest();
}

@injectable.Order(-3)
@injectable.Singleton(as: CacheService)
class CacheServiceImpl implements CacheService {
  final SharedPreferences _sharedPreferences;
  CacheServiceImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;
  @override
  Future<void> cacheRequest({required ClockRequest request}) async {
    final jsonString = request.toJson();
    await _sharedPreferences.setString('cachedRequest', jsonString);
  }

  @override
  Future<ClockRequest?> getCachedRequest() async {
    final cachedClockRequestJson =
        _sharedPreferences.getString('cachedRequest');
    if (cachedClockRequestJson == null) return null;

    try {
      print('Cached JSON String: $cachedClockRequestJson');
      final dynamic decodedJson = jsonDecode(cachedClockRequestJson);
      if (decodedJson is! Map<String, dynamic>) {
        throw FormatException('Decoded JSON is not a Map<String, dynamic>');
      }
      final Map<String, dynamic> jsonMap = decodedJson;
      final clockRequest = ClockRequest.fromMap(jsonMap);
      await _sharedPreferences.remove('cachedRequest');
      return clockRequest;
    } catch (e) {
      print('Error decoding cached request: $e');
      return null;
    }
  }
}
