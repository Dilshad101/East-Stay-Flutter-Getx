import 'dart:io';

import 'package:east_stay_vendor/model/room_model.dart';
import 'package:east_stay_vendor/model/vendor_model.dart';
import 'package:east_stay_vendor/services/api_services.dart';
import 'package:get/get.dart';

class VendorController extends GetxController {
  File? profileImage;
  late VendorModel vendor;
  late List<RoomView> vendorRooms;
  setProfileImage(String imagePath) {
    profileImage = File(imagePath);
    update();
  }

  setVendor(VendorModel vendor) {
    this.vendor = vendor;
  }

  getVendorRooms() async {
    try {
      final roomData = await Api.instance
          .getAllRooms(vendor.token!)
          .then((value) => value['roomView']) as List;
      vendorRooms = roomData.map((json) => RoomView.fromJson(json)).toList();
    } catch (e) {
      vendorRooms = [];
    }
  }
}
