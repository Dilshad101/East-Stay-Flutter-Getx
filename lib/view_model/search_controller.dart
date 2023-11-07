import 'package:east_stay_vendor/model/booking_model.dart';
import 'package:east_stay_vendor/model/room_model.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class FilterController extends GetxController {
  final roomList = Get.find<VendorController>().vendorRooms;
  final bookingList = Get.find<VendorController>().bookedRooms;

  List<Rx<RoomView>> filteredRoomList =
      Get.find<VendorController>().vendorRooms;
  List<BookedRoomModel> filteredBookingList =
      Get.find<VendorController>().bookedRooms;

  final searchController = TextEditingController();

  final Debouncer _debouncer = Debouncer(delay: const Duration(seconds: 3));

  searchRoom(String value) {
    _debouncer(
      () {
        filteredRoomList = roomList
            .where((element) =>
                element.value.state.toLowerCase().contains(
                      value.toLowerCase(),
                    ) ||
                element.value.propertyType.toLowerCase().contains(
                      value.toLowerCase(),
                    ))
            .toList();
      },
    );
  }

  onRoomSearch(String value) {
    filteredRoomList = roomList
        .where((room) =>
            room.value.city.toLowerCase().contains(value.toLowerCase()) ||
            room.value.state.toLowerCase().contains(value.toLowerCase()) ||
            room.value.propertyType.toLowerCase().contains(value.toLowerCase()))
        .toList();
    update();
  }

  onBookingSearch(String value) {
    filteredBookingList = bookingList
        .where((bookings) =>
            bookings.user.name.toLowerCase().contains(value.toLowerCase()) ||
            bookings.id.toLowerCase().contains(value.toLowerCase()) ||
            bookings.phone
                .toString()
                .toLowerCase()
                .contains(value.toLowerCase()))
        .toList();
    update();
  }

  void reset() {
    searchController.text = '';
    filteredBookingList = bookingList;
    filteredRoomList = roomList;
  }
}
