import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<String?> getCityName(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        return placemark.locality ?? placemark.administrativeArea;
      }
    } catch (e) {}
    return null;
  }

  static Future<Position?> getCurrentPositionSafe() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) return null;

      LocationPermission p = await Geolocator.checkPermission();
      if (p == LocationPermission.denied) {
        p = await Geolocator.requestPermission();
      }
      if (p == LocationPermission.deniedForever ||
          p == LocationPermission.denied) {
        return null;
      }

      final settings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 0,
      );

      return await Geolocator.getCurrentPosition(locationSettings: settings);
    } catch (e, st) {
      return null;
    }
  }
}
