import 'package:geolocator/geolocator.dart';
import '../errors/exceptions.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationException();
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationException();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationException();
    }

    return await Geolocator.getCurrentPosition();
  }
}