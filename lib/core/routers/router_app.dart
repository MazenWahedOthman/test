import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task/binding/auth/sign_in_binding.dart';
import 'package:task/binding/trip/add_trip_binding.dart';
import 'package:task/binding/trip/trip_summary_binding.dart';
import 'package:task/core/routers/screens.dart';
import 'package:task/view/screens/auth/sign_in_screen.dart';
import 'package:task/view/screens/trip/add_trip_screen.dart';
import 'package:task/view/screens/trip/trip_summary_screen.dart';

class RouterApp {
  static List<GetPage> getPages = [
    GetPage(
      name: Screens.signIn,
      page: () => const SignInScreen(),
      binding: const SignInBinding(),
      transitionDuration: const Duration(milliseconds: 350),
      transition: Transition.leftToRight,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: Screens.addTrip,
      page: () => AddTripScreen(),
      binding: const AddTripBinding(),
      transitionDuration: const Duration(milliseconds: 350),
      transition: Transition.leftToRight,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: Screens.tripSummary,
      page: () =>  TripSummaryScreen(),
      binding: const TripSummaryBinding(),
      transitionDuration: const Duration(milliseconds: 350),
      transition: Transition.leftToRight,
      curve: Curves.easeInOut,
    ),
  ];
}
