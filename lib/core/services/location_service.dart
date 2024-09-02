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
    LocationPermission permission = await Geolocator.checkPermission();

    // Handle the case where the permission is permanently denied
    if (permission == LocationPermission.deniedForever) {
      // Prompt user to open settings
      await Geolocator.openAppSettings();
      // After returning from settings, check the permission status again
      permission = await Geolocator.checkPermission();
      return permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always;
    }

    // Handle the case where permission is denied (but not permanently)
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Check if permission is still not granted after the request
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      // Return false if the permission is not granted after the first request attempt
      return false;
    }

    // Return true if permission is granted
    return true;
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
