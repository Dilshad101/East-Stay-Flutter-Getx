import 'dart:io';

import 'package:east_stay_vendor/repositories/profile_repo.dart';
import 'package:east_stay_vendor/services/firebase_services.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/snackbar_messenger.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  final propertyController = TextEditingController();
  final editFormKey = GlobalKey<FormState>();

  File? profileImage;
  XFile? profile;
  String? imageUrl;
  final vendorController = Get.find<VendorController>();

  void updateUserInfo() async {
    if (editFormKey.currentState!.validate()) {
      imageUrl = vendorController.vendor.value.image;
      if (profile != null && profileImage != null) {
        try {
          final url = await Services.getImageUrl(profileImage!, profile!.name);
          imageUrl = url;
        } catch (e) {
          Get.showSnackbar(getxSnackbar(
              message: "Profile image upload failed", isError: true));
        }
      }
      final data = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'image': imageUrl,
        'propertyName': propertyController.text.trim(),
        'propertyLocation': locationController.text.trim(),
      };
      final either = ProfileRepo().updateVendorInfo(data);
      either.fold((error) {
        Get.showSnackbar(getxSnackbar(message: error.message, isError: T));
      }, (response) {
        if (response['status'] == 'success') {
          vendorController.vendor.value.name = nameController.text.trim();
          vendorController.vendor.value.email = emailController.text.trim();
          vendorController.vendor.value.image = imageUrl;
          vendorController.vendor.value.propertyName =
              propertyController.text.trim();
          vendorController.vendor.value.propertyLocation =
              locationController.text.trim();
          vendorController.vendor.refresh();
          Get.back();
          Get.showSnackbar(getxSnackbar(
              message: 'Profile updated successfully', isError: F));
        } else {
          Get.showSnackbar(
              getxSnackbar(message: 'Something went wrong', isError: T));
        }
      });
    }
  }

  void setProfileImage(XFile img) {
    profile = img;
    profileImage = File(img.path);
    update();
  }

  String? isEmpty(String value) {
    if (value.isEmpty) return 'Field is required';
    return null;
  }

  String? isEmail(String value) {
    if (!GetUtils.isEmail(value)) return 'Enter a valid email address';
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    // profileImage = File(vendor.value.image ?? '');
    nameController.text = vendorController.vendor.value.name;
    emailController.text = vendorController.vendor.value.email;
    locationController.text = vendorController.vendor.value.propertyLocation;
    propertyController.text = vendorController.vendor.value.propertyName;
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    propertyController.dispose();
  }
}
