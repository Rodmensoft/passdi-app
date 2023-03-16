import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passdi_app/app/data/services/geolocator.service.dart';
import 'package:passdi_app/app/data/services/update_location_user.service.dart';
import 'package:passdi_app/app/ui/global_widgets/customed_alert_dialog.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';

class LocationController extends GetxController {
  List places = [];
  late CameraPosition initialCameraPosition;
  LatLng defaultPosition = const LatLng(4.624335, -74.063644);
  final RxSet<Marker> markers = <Marker>{}.obs;
  Completer<GoogleMapController> gmapController =
      Completer<GoogleMapController>();

  RxList<Placemark> placemarks = <Placemark>[].obs;
  RxList<Location> locations = <Location>[].obs;

  TextEditingController searchCtrl = TextEditingController();

  bool get showButton =>
      userLocation['city'] != '' && userLocation['country'] != '';

  RxBool loading = false.obs;
  LatLngBounds get bounds => LatLngBounds(
        northeast: const LatLng(12.4373031682, -66.8763258531),
        southwest: const LatLng(-4.29818694419, -78.9909352282),
      );
  RxMap<String, String> userLocation = {'city': '', 'country': ''}.obs;
  @override
  void onInit() {
    super.onInit();
    initialLocation();
  }

  Future<void> initialLocation() async {
    initialCameraPosition = CameraPosition(
      target: defaultPosition,
      zoom: 10,
    );
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    loading.value = true;
    GeolocatorService geolocatorService = Get.find();
    Position? position = await geolocatorService.determinePosition();

    if (position != null) {
      var latLng = LatLng(position.latitude, position.longitude);
      defaultPosition = latLng;
      await placeMarkFromCoords(latLng);
      if (placemarks.isNotEmpty) {
        assignPlaceMarkSearchText();
      }
    }
    addMarker(defaultPosition);
    await controller.animateCamera(
      CameraUpdate.newLatLngZoom(
        defaultPosition,
        10,
      ),
    );
    loading.value = false;
  }

  Future<void> onSelected(Place place) async {
    Geolocation? geolocation = await place.geolocation;

    await onMoveCameraAddMarker(geolocation?.coordinates);
  }

  Future<void> onMoveCameraAddMarker(LatLng latLng) async {
    final GoogleMapController googleMapController = await gmapController.future;
    await placeMarkFromCoords(latLng);
    if (placemarks.isNotEmpty) {
      assignPlaceMarkSearchText();
    }
    addMarker(latLng);

    await googleMapController.animateCamera(
      CameraUpdate.newLatLngZoom(latLng, 10),
    );
  }

  addMarker(LatLng latLang) {
    markers.clear();
    markers.add(Marker(
      position: latLang,
      markerId: MarkerId(latLang.toString()),
    ));
  }

  @override
  void onClose() {
    print('close');
    super.onClose();
  }

  Future<void> searchLocations(String p0) async {
    try {
      locations.value = [];
      placemarks.value = [];
      locations.value = await locationFromAddress(p0);
      await placeMarkFromCoords(
          LatLng(locations.first.latitude, locations.first.longitude));
    } on Exception {
      locations.value = [];
    }
  }

  Future<void> placeMarkFromCoords(LatLng latLng) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    placemarks.value = [];
    placemarks.add(placemark.first);
  }

  selectedLocation() async {
    await onMoveCameraAddMarker(
        LatLng(locations.first.latitude, locations.first.longitude));
    assignPlaceMarkSearchText();
  }

  void assignPlaceMarkSearchText() {
    searchCtrl.text =
        '${placemarks.first.locality} ${placemarks.first.country}';

    userLocation['city'] = placemarks.first.locality ?? '';
    userLocation['country'] = placemarks.first.country ?? '';
    print(userLocation);
    locations.clear();
    placemarks.clear();
  }

  Future<void> setLocation() async {
    final UpdateLocationService service = Get.find();
    var response = await service.updateLocationUser(data: userLocation);
    customedAlertDialog(response.message);
  }
}
