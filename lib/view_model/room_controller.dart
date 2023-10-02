import 'dart:convert';

import 'package:east_stay_vendor/model/room_model.dart';
import 'package:east_stay_vendor/services/api_services.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/snackbar_messenger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomController extends GetxController {
  RoomController({this.room});
  final Rx<RoomView>? room;
  Rx<bool> showLoading = false.obs;
  double progressValue = 0.5;
  final List<String> amenities = ['Wifi', 'AC', 'TV', 'Kitchen'];
  List<String> selectedAmenities = [];
  List<String> uploadedImages = [];
  Rx<String> selectedCategory = 'Classic'.obs;
  final roomkey = GlobalKey<FormState>();
  final zipController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final addressController = TextEditingController();
  final roomRentController = TextEditingController();
  final capacityController = TextEditingController();
  final totalRoomController = TextEditingController();
  final descriptionController = TextEditingController();
  final propertyType = TextEditingController();

  final vendorController = Get.find<VendorController>();
  bool validatekey() => roomkey.currentState!.validate();

  addRoom({required bool isEdit}) async {
    showLoading.value = true;
    if (selectedAmenities.isEmpty) {
      Get.showSnackbar(
        getxSnackbar(
          message: 'Please Select your Amenities',
          isError: true,
          title: 'Warning',
        ),
      );
      showLoading.value = false;
      return;
    } else if (uploadedImages.isEmpty) {
      Get.showSnackbar(
        getxSnackbar(
          message: 'Please Select your Room photos',
          isError: true,
          title: 'Warning',
        ),
      );
      showLoading.value = false;
      return;
    }

    final Map roomDetails = {
      'property': propertyType.text.trim(),
      'roomNo': totalRoomController.text.trim(),
      'price': roomRentController.text.trim(),
      'adultRate': roomRentController.text.trim(),
      'oneRoom': roomRentController.text.trim(),
      'capacity': capacityController.text.trim(),
      'address': addressController.text.trim(),
      'city': cityController.text.trim(),
      'state': stateController.text.trim(),
      'zip': zipController.text.trim(),
      'description': descriptionController.text.trim(),
      'amenities': selectedAmenities,
      'image': uploadedImages,
      'category': selectedCategory.value,
      'location': vendorController.vendor.value.propertyLocation,
      'parking': 'nill',
      'swimmingPool': 'nill',
      'longitude': '2.294351',
      'latitude': 48.858844,
    };
    final token = vendorController.vendor.value.token!;

    if (!isEdit) {
      final result = await Api.instance.addRoom(roomDetails, token);

      if (result['status'] == 'success') {
        await vendorController.getVendorRooms();
        Get.back();
        Get.showSnackbar(
            getxSnackbar(message: 'Room added successfully', isError: false));
      } else {
        Get.showSnackbar(getxSnackbar(
            message: 'Oops . Something went wrong', isError: true));
      }
      showLoading.value = false;
    } else {
      try {
        final response =
            await Api.instance.updateRoom(token, roomDetails, room!.value.id);
        if (response.statusCode == 200) {
          final status = jsonDecode(response.body);
          if (status['status'] == 'success') {
            room!.value.address = addressController.text.trim();
            room!.value.adultsRate = roomRentController.text.trim();
            room!.value.amenities = selectedAmenities;
            room!.value.capacity = capacityController.text.trim();
            room!.value.category = selectedCategory.value;
            room!.value.city = cityController.text.trim();
            room!.value.description = descriptionController.text.trim();
            room!.value.img = uploadedImages;
            room!.value.price = roomRentController.text.trim();
            room!.value.propertyType = propertyType.text.trim();
            room!.value.state = stateController.text.trim();
            room!.value.totalRooms = totalRoomController.text.trim();
            room!.value.zip = zipController.text.trim();
            room!.refresh();
            Get.back();
            Get.showSnackbar(getxSnackbar(
                message: 'Room updated successfully', isError: false));
          }
        }
      } catch (e) {
        Get.showSnackbar(getxSnackbar(
            message: 'Oops something went wrong !!', isError: true));
      }
      showLoading.value = false;
    }
  }

  
  deleteRoom(String roomId, String token) async {
    try {
      final response = await Api.instance.deleteRoom(token, roomId);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200 && result['status'] == 'success') {
        vendorController.vendorRooms
            .removeWhere((room) => room.value.id == roomId);
        vendorController.update();
        Get.back();
        Get.showSnackbar(
            getxSnackbar(message: result['message'], isError: false));
      }
    } catch (e) {
      Get.showSnackbar(
          getxSnackbar(message: "Oops Something went wrong", isError: true));
    }
  }

  String? isEmpty(String value) {
    if (value.isEmpty) return 'Field is required';
    return null;
  }

  String? isNumber(String value) {
    final reg = RegExp(r'[^0-9-]');
    if (value.isEmpty) {
      return 'Field is required';
    } else if (reg.hasMatch(value)) {
      return 'Only numbers are allowed';
    }
    return null;
  }

  updateProgress({required bool isUpdateed}) {
    if (isUpdateed) {
      progressValue += .5;
    } else {
      progressValue -= .5;
    }
    update();
  }

  updateAmenities({required int index, required bool isAdd}) {
    if (isAdd) {
      selectedAmenities.add(amenities[index]);
    } else {
      selectedAmenities.removeWhere((element) => element == amenities[index]);
    }
    update();
  }

  updateImageList({required String imagePath, required bool isAdd}) {
    if (isAdd) {
      uploadedImages.add(imagePath);
    } else {
      uploadedImages.removeWhere((element) => element == imagePath);
    }
    update();
  }


  @override
  void onInit() {
    super.onInit();
    if (room != null) {
      zipController.text = room!.value.zip;
      cityController.text = room!.value.city;
      stateController.text = room!.value.state;
      roomRentController.text = room!.value.price;
      propertyType.text = room!.value.propertyType;
      addressController.text = room!.value.address;
      capacityController.text = room!.value.capacity;
      totalRoomController.text = room!.value.totalRooms;
      descriptionController.text = room!.value.description;
      selectedAmenities = room!.value.amenities;
      selectedCategory = room!.value.category.obs;
      uploadedImages = room!.value.img;
    }
  }

  @override
  void onClose() {
    super.onClose();
    propertyType.dispose();
    zipController.dispose();
    cityController.dispose();
    stateController.dispose();
    addressController.dispose();
    roomRentController.dispose();
    capacityController.dispose();
    totalRoomController.dispose();
    descriptionController.dispose();
  }
}
