import 'dart:convert';
import 'dart:io';

import 'package:east_stay_vendor/services/api_services.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  final propertyController = TextEditingController();
  final editFormKey = GlobalKey<FormState>();
  final _api = Api.instance;

  File? profileImage;

  final vendorController = Get.find<VendorController>();

  void validateFields() async {
    if (editFormKey.currentState!.validate()) {
      final data = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'image': profileImage?.path ?? '',
        'propertyName': propertyController.text.trim(),
        'propertyLocation': locationController.text.trim(),
      };
      final response =
          await _api.editVendor(data, vendorController.vendor.value.token!);

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (result['status'] == 'success') {
          vendorController.vendor.value.name = nameController.text.trim();
          vendorController.vendor.value.email = emailController.text.trim();
          vendorController.vendor.value.propertyName =
              propertyController.text.trim();
          vendorController.vendor.value.propertyLocation =
              locationController.text.trim();
          vendorController.vendor.refresh();
          Get.back();
        }
      }
    }
  }

  void setProfileImage(String imagePath) {
    profileImage = File(imagePath);
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
