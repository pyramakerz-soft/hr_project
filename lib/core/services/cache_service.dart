import 'dart:convert';
import 'package:injectable/injectable.dart' as injectable;
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheService {
  Future<void> cacheRequest({required ClockRequest request});
  Future<ClockRequest?> getCachedRequest();
  Future<void> cacheUser({required User user});
  Future<User?> getCachedUser();
}

@injectable.Order(-3)
@injectable.Singleton(as: CacheService)
class CacheServiceImpl implements CacheService {
  final SharedPreferences _sharedPreferences;
  CacheServiceImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;
  @override
  Future<void> cacheRequest({required ClockRequest request}) async {
    final requestToJson = request.toJson();
    await _sharedPreferences.setString('cachedRequest', requestToJson);
  }

  @override
  Future<ClockRequest?> getCachedRequest() async {
    final cachedClockRequestJson =
        _sharedPreferences.getString('cachedRequest');
    if (cachedClockRequestJson == null) return null;

    try {
      final jsonMap = jsonDecode(cachedClockRequestJson);
      final clockRequest = ClockRequest.fromMap(jsonMap);
      await _sharedPreferences.remove('cachedRequest');
      return clockRequest;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> cacheUser({required User user}) async {
    final userToJson = json.encode(user.toJson());
    await _sharedPreferences.remove('user');
    await _sharedPreferences.setString('user', userToJson);
  }

  @override
  Future<User?> getCachedUser() async {
    final userJson = _sharedPreferences.getString('user');
    if (userJson == null) return null;

    try {
      final jsonMap = jsonDecode(userJson);
      final cachedUser = User.fromJson(jsonMap);
      return cachedUser;
    } catch (e) {
      return null;
    }
  }
}
