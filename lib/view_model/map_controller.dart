import 'package:east_stay_vendor/utils/map_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapBoxController extends GetxController {
  LatLng latlong = const LatLng(9.931233, 76.267303);
  LatLng? selectedLatLng;
  var searchResults = [];
  final searchController = TextEditingController();
  MapController mapController = MapController();

  onSelected(LatLng newLatLng) {
    latlong = newLatLng;
    selectedLatLng=newLatLng;
    mapController.move(latlong, 15);
    searchResults.clear();
    update();
  }

  onTaped(LatLng newLatLng) {
    latlong = newLatLng;
    selectedLatLng=newLatLng;
    update();
  }

  onSubmitted(String query) async {
    searchResults = await MapBoxHelper.getSearchResults(query);
    update();
  }
}
