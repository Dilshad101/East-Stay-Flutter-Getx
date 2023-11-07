import 'package:east_stay_vendor/repositories/auth_repo.dart';
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
  final vendorController = Get.find<VendorController>();
  String? token;
  validateLogin() async {
    if (loginKey.currentState!.validate()) {
      showLoading.value = true;
      Map<String, dynamic> inputData = {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim()
      };
      final either = await AuthRepo().loginVendor(inputData);
      either.fold((error) {
        Get.showSnackbar(getxSnackbar(message: error.message, isError: true));
      }, (response) async {
        if (response['status'] == 'success') {
          token = response['token'];
          await SharedPref.instence.setToken(token!);
        } else {
          Get.showSnackbar(
            getxSnackbar(message: response['message'], isError: true),
          );
          showLoading.value = false;
        }
      });
      if (token != null) {
        final data = await vendorController.getVendorData(token!);
        if (data != null) {
          showLoading.value = false;
          Get.off(() => ScreenParent());
          Get.showSnackbar(
              getxSnackbar(message: 'Welcome Back', isError: false));
          token = null;
          emailController.clear();
          passwordController.clear();
        } else {
          showLoading.value = false;
        }
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
