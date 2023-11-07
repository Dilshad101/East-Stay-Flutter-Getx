import 'package:east_stay_vendor/model/coupon_model.dart';
import 'package:east_stay_vendor/repositories/coupon_repo.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/snackbar_messenger.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CouponController extends GetxController {
  DateTime? _selectedDate;
  final vendorController = Get.find<VendorController>();
  final String token = Get.find<VendorController>().vendor.value.token!;

  final codeController = TextEditingController();
  final discountController = TextEditingController();
  final endDateController = TextEditingController();
  final startDateController = TextEditingController();

  final couponKey = GlobalKey<FormState>();

  addToCouponList() async {
    if (couponKey.currentState!.validate()) {
      final startDate =
          DateFormat('dd-MM-yyyy', 'en-US').parse(startDateController.text);
      final endDate =
          DateFormat('dd-MM-yyyy', 'en-US').parse(endDateController.text);
      if (startDate.isAfter(endDate)) {
        Get.showSnackbar(getxSnackbar(
            message: 'End date should be after Start date', isError: true));
        return;
      }
      final discountRate = double.parse(discountController.text.trim());
      final startingDate = startDate.toIso8601String();
      final endingDate = endDate.toIso8601String();
      final couponData = {
        'code': codeController.text.toUpperCase().trim(),
        'discount': discountRate,
        'startDate': startingDate,
        'endDate': endingDate,
      };
      final either = await CouponRepo().createCoupons(couponData);
      either.fold((error) {
        Get.showSnackbar(getxSnackbar(message: error.message, isError: true));
      }, (response) {
        if (response['status'] == 'success') {
          final coupon = Coupon.fromJson(response['coupons']);
          vendorController.couponList.add(coupon);
          vendorController.update();
          Get.back();
          Get.showSnackbar(getxSnackbar(
              message: 'Coupon Added Successfully', isError: false));
          discountController.clear();
          codeController.clear();
          endDateController.clear();
          startDateController.clear();
        } else {
          Get.showSnackbar(
              getxSnackbar(message: 'Something went wrong', isError: true));
        }
      });
    }
  }

  deleteCoupon(String couponId) async {
    final either = CouponRepo().deleteCoupon(couponId);
    either.fold((error) {
      Get.showSnackbar(getxSnackbar(message: error.message, isError: false));
    }, (response) {
      if (response['status'] == 'success') {
        Get.find<VendorController>().deleteCoupon(couponId);
      } else {
        Get.showSnackbar(
            getxSnackbar(message: 'Something went wrong', isError: false));
      }
    });
  }

  DateTime getDate(String date) {
    DateFormat format = DateFormat('dd-MM-yyyy');
    return format.parse(date);
  }

  String getFromatedDate(DateTime? date) {
    if (date != null) {
      final formatedString = DateFormat('dd-MM-yyyy').format(date);
      return formatedString;
    }
    return '';
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

  String? isDateEmpty(bool isFirst) {
    if (isFirst
        ? startDateController.text.trim().isEmpty
        : endDateController.text.trim().isEmpty) {
      return 'Please Selcet Date';
    }
    return null;
  }

  void setDate(BuildContext context, bool isFirst) async {
    _selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    isFirst
        ? startDateController.text = getFromatedDate(_selectedDate)
        : endDateController.text = getFromatedDate(_selectedDate);
  }

  @override
  void onClose() {
    super.onClose();
    discountController.dispose();
    codeController.dispose();
    endDateController.dispose();
    startDateController.dispose();
  }
}
