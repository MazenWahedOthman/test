import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:task/controller/trip/add_trip_controller.dart';
import 'package:task/view/widgets/trip/add_trip/floating_action_start_trip.dart';
import 'package:task/view/widgets/trip/add_trip/trip_location.dart';

class AddTripScreen extends StatelessWidget {
  AddTripScreen({super.key});

  final AddTripController addTripController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Obx(
                () => GoogleMap(
                  scrollGesturesEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onTap: addTripController.onTapMap,
                  zoomControlsEnabled: false,
                  polylines:
                      Set<Polyline>.of(addTripController.polylineMap.values),
                  markers: addTripController.markers.toSet(),
                  onMapCreated: (controller) =>
                      addTripController.onMapCreated(controller),
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      addTripController.currentLat.value,
                      addTripController.currentLong.value,
                    ),
                    zoom: 15,
                  ),
                ),
              ),
              TripLocation(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionStartTrip(),
    );
  }
}
