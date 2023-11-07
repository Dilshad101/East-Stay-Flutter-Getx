import 'package:east_stay_vendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showPopup({
  required String title,
  required String subtitle,
  required VoidCallback onProceed,
  required VoidCallback onCancelled,
  required String buttonText,
}) {
  Get.defaultDialog(
    middleText: subtitle,
    title: title,
    cancel: TextButton(onPressed: onCancelled, child: const Text('Cancel')),
    middleTextStyle: const TextStyle(
        fontSize: 13, fontWeight: FontWeight.w500, color: AppColor.textPrimary),
    confirm: TextButton(
      onPressed: onProceed,
      child:  Text(
        buttonText,
        style:const TextStyle(color: AppColor.primaryColor),
      ),
    ),
  );
}
