import 'dart:io';
import 'dart:math';

import 'package:east_stay_vendor/model/room_model.dart';
import 'package:east_stay_vendor/repositories/room_repo.dart';
import 'package:east_stay_vendor/services/firebase_services.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/snackbar_messenger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

class RoomController extends GetxController {
  RoomController({this.room});
  final Rx<RoomView>? room;
  final pos = '';
  List? urlList = [];
  Rx<bool> showLoading = false.obs;
  double progressValue = 0.5;
  final List<String> amenities = ['Wifi', 'AC', 'TV', 'Kitchen'];
  List<String> selectedAmenities = [];
  List<XFile> images = [];
  LatLng? selectedLatLng;

  Rx<String> selectedCategory = 'Classic'.obs;
  final roomkey = GlobalKey<FormState>();
  final propertyType = TextEditingController();
  final zipController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final addressController = TextEditingController();
  final roomRentController = TextEditingController();
  final capacityController = TextEditingController();
  final totalRoomController = TextEditingController();
  final descriptionController = TextEditingController();
  final vendorController = Get.find<VendorController>();

  bool validatekey() => roomkey.currentState!.validate();

  addRoom({required bool isEdit}) async {
    List imageUrl = [];

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
    }
    if (selectedLatLng == null) {
      Get.showSnackbar(
        getxSnackbar(
          message: 'Add your property location',
          isError: true,
          title: 'Warning',
        ),
      );
      showLoading.value = false;
      return;
    }
//validation in edit mode//
    if (isEdit) {
      if (images.length + urlList!.length > 4) {
        Get.showSnackbar(
          getxSnackbar(
            message: 'You can only select upto 4 images',
            isError: true,
            title: 'Warning',
          ),
        );
        showLoading.value = false;
        return;
      } else if (images.length + urlList!.length < 4) {
        Get.showSnackbar(
          getxSnackbar(
            message: 'Room need 4 images',
            isError: true,
            title: 'Warning',
          ),
        );
        showLoading.value = false;
        return;
      } else if (images.isNotEmpty) {
        for (var img in images) {
          imageUrl.add(await Services.getImageUrl(File(img.path), img.name));
        }
        urlList!.addAll(imageUrl);
        // imageUrl = urlList!;
      }
// validation in add room//;
    } else if (!isEdit) {
      if (images.isEmpty || images.length < 4) {
        Get.showSnackbar(
          getxSnackbar(
            message: 'Room need 4 photos',
            isError: true,
            title: 'Warning',
          ),
        );
        showLoading.value = false;

        return;
      }
      for (var img in images) {
        imageUrl.add(
            await Services.getImageUrl(File(img.path), generateUniqueID()));
      }
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
      'image': imageUrl,
      'category': selectedCategory.value,
      'location': vendorController.vendor.value.propertyLocation,
      'parking': 'nill',
      'swimmingPool': 'nill',
      'longitude': selectedLatLng!.longitude.toString(),
      'latitude': selectedLatLng!.latitude,
    };

    if (!isEdit) {
      final either = await RoomRepo().addRoom(roomDetails);
      either.fold((error) {
        Get.showSnackbar(getxSnackbar(message: error.message, isError: true));
      }, (response) async {
        if (response['status'] == 'success') {
          await vendorController.getVendorRooms();
          showLoading.value = false;
          Get.back();
          Get.showSnackbar(
              getxSnackbar(message: 'Room added successfully', isError: false));
        } else {
          showLoading.value = false;
          Get.showSnackbar(
              getxSnackbar(message: 'Something went wrong', isError: true));
        }
      });
    } else {
      final either = await RoomRepo().updateRoom(roomDetails, room!.value.id);
      either.fold((error) {
        Get.showSnackbar(getxSnackbar(message: error.message, isError: true));
      }, (response) {
        if (response['status'] == 'success') {
          room!.value.address = addressController.text.trim();
          room!.value.adultsRate = roomRentController.text.trim();
          room!.value.amenities = selectedAmenities;
          room!.value.capacity = capacityController.text.trim();
          room!.value.category = selectedCategory.value;
          room!.value.city = cityController.text.trim();
          room!.value.description = descriptionController.text.trim();
          room!.value.img = urlList!;
          room!.value.price = roomRentController.text.trim();
          room!.value.propertyType = propertyType.text.trim();
          room!.value.state = stateController.text.trim();
          room!.value.totalRooms = totalRoomController.text.trim();
          room!.value.zip = zipController.text.trim();
          room!.value.latitude = selectedLatLng!.latitude;
          room!.value.longitude = selectedLatLng!.longitude.toString();
          room!.refresh();
          Get.back();
          Get.showSnackbar(getxSnackbar(
              message: 'Room updated successfully', isError: false));
        }
      });
      showLoading.value = false;
    }
  }

  deleteRoom(String roomId) async {
    final either = await RoomRepo().deleteRoom(roomId);
    either.fold((error) {
      Get.showSnackbar(getxSnackbar(message: error.message, isError: true));
    }, (response) {
      if (response['status'] == 'success') {
        vendorController.vendorRooms
            .removeWhere((room) => room.value.id == roomId);
        vendorController.update();
        Get.back();
        Get.showSnackbar(
            getxSnackbar(message: response['message'], isError: false));
      } else {
        Get.showSnackbar(getxSnackbar(
          message: response['message'] ?? 'Something went wrong',
          isError: true,
        ));
      }
    });
  }

  String? isEmpty(String value) {
    if (value.isEmpty) return 'Field is required';
    return null;
  }

  String? isNumber(String value) {
    final reg = RegExp(r'[^0-9-]');
    if (value.isEmpty) return 'Field is required';
    if (reg.hasMatch(value)) return 'Only numbers are allowed';
    return null;
  }

  updateProgress({required bool isUpdateed}) {
    isUpdateed ? progressValue += .5 : progressValue -= .5;
    update();
  }

  updateAmenities({required int index, required bool isAdd}) {
    isAdd
        ? selectedAmenities.add(amenities[index])
        : selectedAmenities
            .removeWhere((element) => element == amenities[index]);
    update();
  }

  addImage({bool edit = false}) async {
    if (edit || urlList!.length >= 4) {
      Get.showSnackbar(getxSnackbar(
          message: 'Please delete some old images', isError: true));
      return;
    }

    final imagepaths = await ImagePicker().pickMultiImage();
    if (imagepaths.length > 4 || imagepaths.length + images.length > 4) {
      Get.showSnackbar(getxSnackbar(
          message: 'Only 4 images can be selected', isError: true));
      return;
    } else if (edit || urlList!.length + imagepaths.length > 4) {
      Get.showSnackbar(getxSnackbar(
          message: 'Only 4 images can be selected', isError: true));
      return;
    }
    for (var i in imagepaths) {
      images.add(i);
    }
    update();
  }

  removeImage(XFile image) {
    images.removeWhere((element) => element == image);
    update();
  }

  @override
  void onReady() {
    super.onReady();
    if (room != null) {
      urlList!.addAll(room!.value.img);
      zipController.text = room!.value.zip;
      cityController.text = room!.value.city;
      stateController.text = room!.value.state;
      roomRentController.text = room!.value.price;
      propertyType.text = room!.value.propertyType;
      addressController.text = room!.value.address ?? '';
      capacityController.text = room!.value.capacity;
      totalRoomController.text = room!.value.totalRooms;
      descriptionController.text = room!.value.description;
      selectedAmenities = room!.value.amenities;
      selectedCategory = room!.value.category.obs;
      selectedLatLng = LatLng(double.parse("${room!.value.latitude}"),
          double.parse(room!.value.longitude));
      images = [];
    } else {}
  }

  String generateUniqueID() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(1000000);
    return '$timestamp-$random';
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
