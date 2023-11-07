import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view/add_edit_room_page.dart';
import 'package:east_stay_vendor/view/room_details_page.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/room_grid_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenRooms extends StatelessWidget {
  const ScreenRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Rooms'),
        // actions: [
        //   const SizedBox(width: 10),
        //   CircleAvatar(
        //     backgroundColor: AppColor.primaryColor,
        //     child: IconButton(
        //       onPressed: () => Get.to(() => ScreenAddRoom()),
        //       icon: const Icon(Icons.add, color: Colors.white),
        //     ),
        //   ),
        //   const SizedBox(width: 15),
        // ],
      ),
      body: GetBuilder<VendorController>(
        builder: (controller) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: controller.vendorRooms.length,
            itemBuilder: (context, index) => Obx(
              () => GestureDetector(
                onTap: () => Get.to(
                  () => ScreenRoomDetails(room: controller.vendorRooms[index]),
                  transition: Transition.cupertinoDialog,
                ),
                child: RoomGridTile(
                  room: controller.vendorRooms[index].value,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => ScreenAddRoom()),
        label: const Text(
          'AddRoom',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        icon: const Icon(Icons.add),
        backgroundColor: AppColor.primaryColor,
      ),
    );
  }
}
