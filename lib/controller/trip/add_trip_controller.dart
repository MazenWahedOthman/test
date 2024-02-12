import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:task/core/constants/strings.dart';
import 'package:task/core/functions/app/handle_location.dart';
import 'package:task/core/routers/screens.dart';
import 'package:task/helpers/ui/app_dialog.dart';
import 'package:task/helpers/ui/app_snackbar.dart';
import 'package:task/model/trip/trip.dart';

class AddTripController extends GetxController {
  final TextEditingController startLocationController = TextEditingController();
  final TextEditingController endLocationController = TextEditingController();

  late GoogleMapController mapController;

  Marker? startLocatonMarker;
  Marker? endLocationMarker;

  RxList<Marker> markers = <Marker>[].obs;

  final RxDouble currentLat = 25.2048.obs;
  final RxDouble currentLong = 55.2708.obs;

  final RxBool isSelectStartLocation = false.obs;
  final RxBool isSelectEndLocation = false.obs;

  final RxBool canStartTrip = false.obs;

  LatLng? orgin;
  LatLng? destination;

  late String startTime;
  late String endTime;
  late String duration;

  PolylinePoints polylinePoints = PolylinePoints();

  RxMap<PolylineId, Polyline> polylineMap = <PolylineId, Polyline>{}.obs;

  final List<LatLng> routePoints = [];

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }

  Future<void> getCurrentLocation() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentLat.value = position.latitude;
    currentLong.value = position.longitude;
    mapController.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(currentLat.value, currentLong.value), 14));
  }

  Future<void> onMapCreated(GoogleMapController controller) async =>
      mapController = controller;

  Future<void> onTapMap(LatLng latLng) async {
    if (startLocatonMarker == null) {
      await addStartMarker(latLng);
      await checkCanStartTrip();

      return;
    }
    if (endLocationMarker == null) {
      await addEndMarker(latLng);
      await checkCanStartTrip();
    }
  }

  Future<void> addStartMarker(LatLng latLng) async {
    Get.context!.loaderOverlay.show();
    final String? locationName =
        await getLocationName(latLng).catchError(handleError);
    Get.context!.loaderOverlay.hide();

    if (locationName != null) {
      final marker = Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
      orgin = latLng;
      startLocatonMarker = marker;
      isSelectStartLocation.value = true;
      startLocationController.text = locationName;
      markers.add(marker);
    }
  }

  Future<void> addEndMarker(LatLng latLng) async {
    Get.context!.loaderOverlay.show();
    final String? locationName =
        await getLocationName(latLng).catchError(handleError);
    Get.context!.loaderOverlay.hide();
    if (locationName != null) {
      final marker = Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      );
      destination = latLng;
      endLocationMarker = marker;
      isSelectEndLocation.value = true;
      endLocationController.text = locationName;
      markers.add(marker);
    }

    return;
  }

  Future<void> checkCanStartTrip() async {
    if (startLocatonMarker != null && endLocationMarker != null) {
      canStartTrip.value = true;
    }
  }

  Future<String?> getLocationName(LatLng latLng) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String city = placemark.locality ?? '';
        String street = placemark.street ?? '';

        return '$city, $street';
      }
    } catch (error) {
      rethrow;
    }

    return null;
  }

  Future<void> getLatLngFromAddress({
    required String? locationName,
    required bool isStart,
  }) async {
    if (locationName != null && locationName.length >= 3) {
      Get.context!.loaderOverlay.show();
      List<Location>? locations =
          await locationFromAddress(locationName).catchError(handleError);
      Get.context!.loaderOverlay.hide();
      if (locations.isNotEmpty) {
        Location location = locations[0];
        final LatLng latLng = LatLng(location.latitude, location.longitude);

        if (isStart) {
          setStartMarker(latLng);
          return;
        }
        setEndMarker(latLng);
      }
    }
  }

  void setStartMarker(LatLng latLng) {
    final Marker marker = Marker(
      markerId: MarkerId(latLng.toString()),
      position: latLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    orgin = latLng;

    startLocatonMarker = marker;
    isSelectStartLocation.value = true;
    markers.add(marker);
    mapController.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(latLng.latitude, latLng.longitude), 14));
    checkCanStartTrip();
  }

  void setEndMarker(LatLng latLng) {
    final Marker marker = Marker(
      markerId: MarkerId(latLng.toString()),
      position: latLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    destination = latLng;

    endLocationMarker = marker;
    isSelectEndLocation.value = true;
    markers.add(marker);
    mapController.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(latLng.latitude, latLng.longitude), 14));
    checkCanStartTrip();
  }

  void onDeleteStartLocation() {
    markers.removeWhere(
        (element) => element.markerId == startLocatonMarker?.markerId);
    startLocatonMarker = null;
    orgin = null;
    polylineMap.value = {};
    startLocationController.text = "";
    isSelectStartLocation.value = false;
    canStartTrip.value = false;
  }

  void onDeleteEndLocation() {
    markers.removeWhere(
        (element) => element.markerId == endLocationMarker?.markerId);
    endLocationMarker = null;
    destination = null;
    polylineMap.value = {};
    endLocationController.text = "";
    isSelectEndLocation.value = false;
    canStartTrip.value = false;
  }

  Future<void> onTapStartTrip() async {
    canStartTrip.value = false;
    Get.context!.loaderOverlay.show();
    await getDirection();
    Get.context!.loaderOverlay.hide();
  }

  Future<void> getDirection() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints
        .getRouteBetweenCoordinates(
          apiKey,
          PointLatLng(orgin!.latitude, orgin!.longitude),
          PointLatLng(destination!.latitude, destination!.longitude),
          travelMode: TravelMode.driving,
        )
        .catchError(handleError);

    if (result.points.isNotEmpty) {
      for (final point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        routePoints.add(LatLng(point.latitude, point.longitude));
      }
      addPolyLine(polylineCoordinates);
    }
  }

  Future<void> addPolyLine(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylineMap[id] = polyline;
    await startTrip();
  }

  Future<void> startTrip() async {
    startTime = getCurrentDateTime();
    final DateTime startDate = DateTime.now();
    for (int i = 0; i < routePoints.length; i++) {
      await Future.delayed(const Duration(milliseconds: 1500));
      markers.removeWhere(
          (element) => element.markerId == startLocatonMarker?.markerId);
      final Marker marker = Marker(
        markerId: MarkerId((routePoints[i]).toString()),
        position: routePoints[i],
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
      startLocatonMarker = marker;
      markers.add(marker);
    }
    endTime = getCurrentDateTime();
    final DateTime endDate = DateTime.now();

    duration = calculateTimeDifference(startDate, endDate);
    AppDialog.endTripDialog();
  }

  String getCurrentDateTime() {
    DateTime now = DateTime.now();
    final String dateTime = DateFormat.yMMMMd().add_Hm().format(now);
    return dateTime;
  }

  String calculateTimeDifference(DateTime startTime, DateTime endTime) {
    Duration difference = endTime.difference(startTime);
    return "${difference.inHours} hours and ${difference.inMinutes.remainder(60)} minutes";
  }

  Future<void> onTapTripSummary() async {
    final Trip trip = Trip(
      duration: duration,
      startTime: startTime,
      endTime: endTime,
      orgin: orgin!,
      destination: destination!,
      startLocation: startLocationController.text,
      endLocation: endLocationController.text,
    );
    initializeValues();
    await Get.offNamed(Screens.tripSummary, arguments: {
      "trip": trip,
    });
  }

  void initializeValues() {
    startLocationController.text = "";
    endLocationController.text = "";
    startLocatonMarker = null;
    endLocationMarker = null;
    isSelectStartLocation.value = false;
    isSelectEndLocation.value = false;
    canStartTrip.value = false;
    orgin = null;
    destination = null;
    polylineMap.value = {};
    routePoints.clear();
    markers.clear();
    polylinePoints = PolylinePoints();
  }

  dynamic handleError(error) {
    AppSnackBar.showSnackBar(
      message: "An error occurred. Please try again later.",
      backgroundColor: Colors.red,
    );
  }

  @override
  void onClose() {
    startLocationController.dispose();
    endLocationController.dispose();
    markers.close();
    currentLat.close();
    currentLong.close();
    isSelectStartLocation.close();
    isSelectEndLocation.close();
    canStartTrip.close();
    polylineMap.close();
    super.onClose();
  }
}
