import 'package:east_stay_vendor/view/edit_profile_page.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/divider_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({super.key});
  final vendorController = Get.find<VendorController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        title: const Text('Your Profile'),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => ScreenEditProfile()),
            icon: const Icon(
              BoxIcons.bx_pencil,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Personal Details',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Dividertext(
                title: 'Name', subtilte: vendorController.vendor.value.name),
            const SizedBox(height: 6),
            Dividertext(
                title: 'Email', subtilte: vendorController.vendor.value.email),
            const SizedBox(height: 6),
            Dividertext(
                title: 'Contact',
                subtilte: vendorController.vendor.value.phone),
            const SizedBox(height: 20),
            const Text('Property Details',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Dividertext(
                title: 'name',
                subtilte: vendorController.vendor.value.propertyName),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Dividertext(
                        title: 'Total Rooms',
                        subtilte:
                            vendorController.vendorRooms.length.toString()),
                  ),
                ),
                const Expanded(
                  child: Dividertext(title: 'Total Booking', subtilte: '15'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
