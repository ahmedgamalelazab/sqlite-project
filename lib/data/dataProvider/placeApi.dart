import 'package:native_device_devices/data/Models/place.dart';

abstract class PlaceApi {
  List<Place> getPlaces();
}

class PlacesApiProvider extends PlaceApi {
  @override
  List<Place> getPlaces() {
    return [];
  }
}
