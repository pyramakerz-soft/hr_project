// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String Uid = 'UID_TOKEN';
const String APPLE_EMAIL = 'APPLE_EMAIL';
const String EMAIL = 'EMAI;';
const String PASSWORD = 'PASSWORD';
const String TOKEN = 'TOKEN';
const String STEPS = 'STEPS';

const String FIREBASE_NOTIFICATION_TOKEN = 'FIREBASENOTIFICATIONTOKEN';
const String USER_LOGGED_IN = 'USERLOGGEDIN';
const String INGREDIENTS_SEARCH_IDS = 'INGREDIENTS_SEARCH_IDS';

@Order(-4)
@Injectable()
class AppPreferences {
  SharedPreferences sharedPreferences;
  AppPreferences({
    required this.sharedPreferences,
  });

  Future<void> addIngredientSearchId(
    int id,
  ) async {
    List<IngredientHistorySearchData> currentIds =
        await getIngredientSearchIds();
    currentIds
        .add(IngredientHistorySearchData(id: id, dateTime: DateTime.now()));
    await sharedPreferences.setStringList(
      INGREDIENTS_SEARCH_IDS,
      currentIds
          .map((data) => "${data.id}:${data.dateTime.toIso8601String()}")
          .toList(),
    );
  }

  Future<void> clearAllIngredients() async {
    await sharedPreferences.remove(INGREDIENTS_SEARCH_IDS);
  }

  Future<List<IngredientHistorySearchData>> getIngredientSearchIds() async {
    List<String>? idsString =
        sharedPreferences.getStringList(INGREDIENTS_SEARCH_IDS);
    if (idsString != null) {
      return idsString.map((idString) {
        List<String> parts = idString.split(":");
        int id = int.parse(parts[0]);
        DateTime dateTime = DateTime.parse(parts[1]);
        return IngredientHistorySearchData(id: id, dateTime: dateTime);
      }).toList();
    } else {
      return [];
    }
  }

  Future<void> saveUserUid(String uid) async {
    await sharedPreferences.setString(Uid, uid);
  }

  Future<void> saveLastStepCount(int steps) async {
    await sharedPreferences.setInt(STEPS, steps);
  }

  int getLastStepCount() => sharedPreferences.getInt(STEPS) ?? 0;

  Future<void> saveAppleEmail(String email) async {
    await sharedPreferences.setString(APPLE_EMAIL, email);
  }

  String? getAppleEmail() => sharedPreferences.getString(APPLE_EMAIL);

  Future<void> removeToken() async => await sharedPreferences.remove(TOKEN);
  Future<void> saveToken(String token) async =>
      await sharedPreferences.setString(TOKEN, token);

  String? getToken() => sharedPreferences.getString(TOKEN);

  Future<void> saveFirbaseNotificationToken(String token) async =>
      await sharedPreferences.setString(FIREBASE_NOTIFICATION_TOKEN, token);

  String? getFirebaseNotificationPushToken() =>
      sharedPreferences.getString(FIREBASE_NOTIFICATION_TOKEN);

  Future<void> saveUserEmail(String email) async {
    sharedPreferences.setString(EMAIL, email);
  }

  Future<void> saveUserPassword(String password) async {
    await sharedPreferences.setString(PASSWORD, password);
  }

  String getUid() {
    return sharedPreferences.getString(Uid) ?? '';
  }

  Future<String> getEmail() async {
    return sharedPreferences.getString(EMAIL) ?? '';
  }

  Future<String> getPassword() async {
    return sharedPreferences.getString(PASSWORD) ?? '';
  }

  Future<void> removeUid() async {
    await sharedPreferences.remove(Uid);
  }

  Future<void> setIsUserLoggedIn(bool logged) async {
    await sharedPreferences.setBool(USER_LOGGED_IN, logged);
  }

  bool isUserLoggedIn() {
    return sharedPreferences.getBool(USER_LOGGED_IN) ?? false;
  }

  // Future<void> setSaveZone(SafeZoneModel safeZone) async {
  //   sharedPreferences.setDouble(LAT, safeZone.lat);
  //   sharedPreferences.setDouble(LONG, safeZone.long);
  //   sharedPreferences.setString(SAFEZONENAME, safeZone.safeZoneName);
  //   sharedPreferences.setDouble(RADIUS, safeZone.radius);
  // }

  // Future<SafeZoneModel?> getSaveZone() async {
  //   final lat = sharedPreferences.getDouble(LAT);
  //   final long = sharedPreferences.getDouble(LONG);
  //   final name = sharedPreferences.getString(SAFEZONENAME);

  //   final red = sharedPreferences.getDouble(RADIUS);
  //   if (lat != null && long != null && name != null && red != null) {
  //     return SafeZoneModel(
  //         lat: lat,
  //         long: long,
  //         safeZoneName: name,
  //         radius: red,
  //         isFindMyHome: true);
  //   } else {
  //     return null;
  //   }
  // }
}

class IngredientHistorySearchData {
  final int id;
  final DateTime dateTime;

  IngredientHistorySearchData({required this.id, required this.dateTime});
}
