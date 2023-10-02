import 'dart:convert';
import 'dart:io';

import 'package:east_stay_vendor/model/vendor_model.dart';
import 'package:east_stay_vendor/services/api_services.dart';
import 'package:east_stay_vendor/view/navigation_page.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../widgets/snackbar_messenger.dart';

class RegistrationController extends GetxController {
  final GlobalKey<FormState> vendorFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> propertyFormKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPassController;
  late final TextEditingController propertyNameController;
  late final TextEditingController propertyLocationController;
  late final TextEditingController mobileController;
  final showLoading = false.obs;
  final api = Api.instance;
  bool passwordCompleted = false;
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
    propertyNameController = TextEditingController();
    propertyLocationController = TextEditingController();
  }

  validateVendor() async {
    if (propertyFormKey.currentState!.validate()) {
      final vendorData = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': mobileController.text.trim(),
        'password': passwordController.text.trim(),
        'confirmPass': confirmPassController.text.trim(),
        'propertyName': propertyNameController.text.trim(),
        'propertyLocation': propertyLocationController.text.trim(),
      };
      try {
        showLoading.value = true;
        final response = await Api.instance.signupVendor(vendorData);
        if (response['status'] == 'success') {
          final String token = response['token'];

          final result = await api.getVendorData(token);
          if (result.statusCode == 200) {
            final vendorData = jsonDecode(result.body);
            final vendor = VendorModel.fromJson(vendorData['vendorDetails'])
              ..token = token;
            Get.find<VendorController>().setVendor(vendor);
            Get.off(() => ScreenParent());
            Get.showSnackbar(getxSnackbar(
              message: 'Account created successfully',
              isError: F,
            ));
            showLoading.value = false;
          } else {
            showLoading.value = false;
            Get.showSnackbar(getxSnackbar(
              message: 'Oops, an error occurred',
              isError: T,
            ));
          }
        } else {
          showLoading.value = false;
          Get.showSnackbar(getxSnackbar(
            message: 'Oops, an error occurred',
            isError: T,
          ));
        }
      } on SocketException {
        showLoading.value = false;
        Get.showSnackbar(getxSnackbar(
          message: 'Network Error: Please check your connection',
          isError: T,
        ));
      } catch (e) {
        showLoading.value = false;
        Get.showSnackbar(getxSnackbar(
          message: 'Oops, Something went wrong',
          isError: T,
        ));
      }
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    } else if (!GetUtils.isEmail(value)) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return 'Minimum 8 charechter required';
    } else if (passwordCompleted) {
      if (passwordController.text != confirmPassController.text) {
        return 'Password does not match';
      }
    }
    return null;
  }

  String? validateConfirmPass(String value) {
    if (value.length < 8) {
      return 'Minimum 8 charechter required';
    } else {
      passwordCompleted = true;
    }
    if (passwordCompleted) {
      if (passwordController.text != confirmPassController.text) {
        return 'Password does not match';
      }
    }
    return null;
  }

  String? validatePropertyName(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String? validateLocation(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String? validateNumber(String value) {
    final RegExp mobileNumber = RegExp(r'^[0-9]{10}$');
    if (!mobileNumber.hasMatch(value)) {
      return 'In valid mobile number';
    }
    return null;
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    propertyNameController.dispose();
    propertyLocationController.dispose();
  }
}
