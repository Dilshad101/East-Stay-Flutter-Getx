import 'package:east_stay_vendor/view/add_edit_room_page.dart';
import 'package:east_stay_vendor/view/search_page.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
  });
  final vendorController = Get.find<VendorController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10, bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: Obx(
                () => Text(vendorController.vendor.value.name[0]),
              )),
          const Spacer(),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert_rounded),
            position: PopupMenuPosition.under,
            color: Colors.grey[800],
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.search_rounded, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      'Add Room',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
            onSelected: (value) async {
              if (value == 1) {
                Get.to(() => ScreenAddRoom());
              } else {
                Get.to(() =>  ScreenSearch());
              }
            },
          )
        ],
      ),
    );
  }
}
