import 'package:east_stay_vendor/model/room_model.dart';
import 'package:east_stay_vendor/model/vendor_model.dart';
import 'package:east_stay_vendor/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorController extends GetxController {
  late Rx<VendorModel> vendor;
  List<Rx<RoomView>> vendorRooms = [];
  final amenities = {
    'TV': Icons.tv,
    'Wifi': Icons.wifi,
    'AC': Icons.ac_unit_rounded,
    'Kitchen': Icons.soup_kitchen_outlined,
  };

  setVendor(VendorModel vendor) {
    this.vendor = vendor.obs;
  }

  Future<void> getVendorRooms() async {
    try {
      final roomData = await Api.instance
          .getAllRooms(vendor.value.token!)
          .then((value) => value['roomView']) as List;
      vendorRooms =
          roomData.map((json) => RoomView.fromJson(json).obs).toList();
    } catch (e) {
      vendorRooms = [];
    }
    update();
  }

  addRoom(RoomView room) {
    vendorRooms.add(room.obs);
    update();
  }
}
