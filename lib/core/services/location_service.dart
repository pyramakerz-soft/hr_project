import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';
import 'package:injectable/injectable.dart' as injectable;

abstract class LocationService {
  Future<Position?> getCurrentLocation();
  Future<bool> askForPermissionIfNeeded();

  Future<String?> getFormattedAddress(
      {required double latitude, required double longitude});
}

@injectable.Order(-2)
@injectable.Singleton(as: LocationService)
class LocationServiceImpl implements LocationService {
  @override
  Future<Position?> getCurrentLocation() async {
    final isGranted = await askForPermissionIfNeeded();
    if (!isGranted) throw 'Permission not granted!';

    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<bool> askForPermissionIfNeeded() async {
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      permission = await Geolocator.requestPermission();
    }

    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  @override
  Future<String?> getFormattedAddress(
      {required double latitude, required double longitude}) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        return '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
      }
    } catch (e) {
      throw 'Unable to retrieve the address at the moment. Please try again later.';
    }
    return null;
  }
}
