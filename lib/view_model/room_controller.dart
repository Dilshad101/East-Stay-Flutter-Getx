import 'package:east_stay_vendor/services/api_services.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/snackbar_messenger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomController extends GetxController {
  Rx<bool> showLoading = false.obs;
  double progressValue = 0.5;
  final List<String> amenities = ['Wifi', 'AC', 'TV', 'Kitchen'];
  List<int> selectedAmenities = [];
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
  // final propertyType=TextEditingController();

  bool validatekey() => roomkey.currentState!.validate();

  addRoom() async {
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
    final selectedAmenitiesList = List.generate(
      selectedAmenities.length,
      (index) => amenities[selectedAmenities[index]],
    );

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
      'amenities': selectedAmenitiesList,
      'image': uploadedImages,
      'category': selectedCategory.value,
      'location': 'Calicut',
      'parking': 'nill',
      'swimmingPool': 'nill',
      'longitude': '2.294351',
      'latitude': 48.858844,
    };
    final token = Get.find<VendorController>().vendor.token!;
    final result = await Api.instance.addRoom(roomDetails, token);
    showLoading.value = false;
    print(result['status']);
    if (result['status'] == 'success') {
      Get.back();
      Get.showSnackbar(
          getxSnackbar(message: 'Room added successfully', isError: false));
    } else {
      Get.showSnackbar(
          getxSnackbar(message: 'Oops . Something went wrong', isError: true));
    }
  }

  String? isEmpty(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
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
      selectedAmenities.add(index);
    } else {
      selectedAmenities.removeWhere((element) => element == index);
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
