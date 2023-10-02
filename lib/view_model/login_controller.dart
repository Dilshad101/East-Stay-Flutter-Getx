import 'dart:convert';
import 'dart:io';

import 'package:east_stay_vendor/model/vendor_model.dart';
import 'package:east_stay_vendor/services/api_services.dart';
import 'package:east_stay_vendor/services/shared_pref.dart';
import 'package:east_stay_vendor/view/navigation_page.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/snackbar_messenger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final showLoading = false.obs;
  final loginKey = GlobalKey<FormState>();
  final api = Api.instance;
  final vendorController = Get.find<VendorController>();
  validateLogin() async {
    if (loginKey.currentState!.validate()) {
      showLoading.value = true;
      Map<String, dynamic> inputData = {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim()
      };
      try {
        final response = await api.loginVendor(inputData);
        if (response.statusCode == 200) {
          final result = jsonDecode(response.body);
          if (result['status'] == 'failed') {
            Get.showSnackbar(
                getxSnackbar(message: result['message'], isError: true));
            showLoading.value = false;
          } else {
            final token = result['token'];
            final vendorResponse = await api.getVendorData(token);
            if (vendorResponse.statusCode == 200) {
              final vendorData = jsonDecode(vendorResponse.body);
              final vendor = VendorModel.fromJson(vendorData['vendorDetails'])
                ..token = token;
              vendorController.setVendor(vendor);
              await vendorController.getVendorRooms();
              showLoading.value = false;
              SharedPref.instence.setVendor(vendor);
              Get.off(() => ScreenParent());
              Get.showSnackbar(
                getxSnackbar(
                  message: 'Welcome Back',
                  isError: false,
                ),
              );
            } else {
              showLoading.value = false;
              Get.showSnackbar(
                getxSnackbar(
                  message: 'Oops Something went wrong!!',
                  isError: true,
                ),
              );
            }
          }
        } else {
          showLoading.value = false;
          Get.showSnackbar(
            getxSnackbar(
              message: 'Oops Something went wrong!!',
              isError: true,
            ),
          );
        }
      } on SocketException {
        showLoading.value = false;
        Get.showSnackbar(
          getxSnackbar(
            message: 'Network Error: Please check your connection ',
            isError: true,
          ),
        );
      } catch (e) {
        showLoading.value = false;
        Get.showSnackbar(getxSnackbar(
          message: 'Oops Something went wrong!!',
          isError: true,
        ));
      }
    }
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
