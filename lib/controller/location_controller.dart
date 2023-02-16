import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/location_model.dart';
import 'package:itsm_mobile/service/location_service.dart';

class LocationController extends GetxController {
  var locations = <LocationModel>[].obs;
  final isLoading = false.obs;
  List<DropdownMenuItem<String>>? list;
  LocationModel? dataLocation;
  List<LocationModel>? dataAllLocations;

  @override
  void onInit() {
    getAllLocation();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllLocation() async {
    isLoading.value = true;
    try {
      print("cek");
      dataAllLocations = await LocationService.getAllLocation();
      print("cek 2");
      addItemLocation();
    } catch (e) {
      print("cek 3");
      print(e);
    }
  }

  Future<void> getLocation(String locationId) async {
    isLoading.value = true;
    try {
      dataLocation = await LocationService.getLocation(locationId);
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  Future<void> addItemLocation() async {
    list = [];
    for (int i = 0; i < dataAllLocations!.length; i++) {
      list!.add(getItemLocation(i));
    }
    for (int i = 0; i < 5; i++) {
      print(list![1]);
    }
  }

  DropdownMenuItem<String> getItemLocation(int i) {
    return DropdownMenuItem<String>(
        value: dataAllLocations![i].id.toString(),
        child: Text(dataAllLocations![i].name));
  }
}
