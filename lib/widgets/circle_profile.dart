import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleProfile extends StatelessWidget {
  CircleProfile({super.key});

  final VendorController vendorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey[400],
        backgroundImage: vendorController.vendor.value.image != null
            ? NetworkImage(vendorController.vendor.value.image!)
            : null,
        child: vendorController.vendor.value.image == null
            ? const Icon(
                Icons.person_2,
                color: Colors.grey,
              )
            : null,
      ),
    );
  }
}
