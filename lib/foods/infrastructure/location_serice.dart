import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

final locationProvider = Provider<Location>((ref) {
  return Location();
});

final locationServiceProvider = Provider<LocationSerice>((ref) {
  return LocationSerice(ref.watch(locationProvider));
});

final latLangProvider = FutureProvider<LatLng>((ref) async {
  return ref.watch(locationServiceProvider).getLocation();
});

class LocationSerice {
  LocationSerice(this._location);
  final Location _location;

  LatLng? _latLng;
  LatLng? get latLang => _latLng;

  Future<void> init() async {
    await _location.requestPermission();
  }

  Future<LatLng> getLocation() async {
    try {
      final locationData = await _location.getLocation();
      final latlang = LatLng(locationData.latitude!, locationData.longitude!);
      _latLng = latLang;
      return latlang;
    } catch (e) {
      return const LatLng(26.4525, 87.2718);
    }
  }
}
