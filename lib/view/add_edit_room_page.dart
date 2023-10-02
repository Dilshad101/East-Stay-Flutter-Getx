import 'package:east_stay_vendor/model/room_model.dart';
import 'package:east_stay_vendor/utils/constents/colors.dart';
import 'package:east_stay_vendor/view_model/room_controller.dart';
import 'package:east_stay_vendor/widgets/custom_button.dart';
import 'package:east_stay_vendor/widgets/loading_button.dart';
import 'package:east_stay_vendor/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_edit_room_sub_page1.dart';
import 'add_edit_room_sub_page2.dart';

class ScreenAddRoom extends StatelessWidget {
  ScreenAddRoom({super.key, this.room});
  final Rx<RoomView>? room;
  final isCompleted = false.obs;
  final List<IconData> icons = [
    Icons.wifi,
    Icons.ac_unit_rounded,
    Icons.tv_rounded,
    Icons.soup_kitchen_outlined,
  ];
  final List<String> items = ['Wifi', 'AC', 'TV', 'Kitchen'];
  @override
  Widget build(BuildContext context) {
    final roomController = Get.put(RoomController(room: room));
    return Scaffold(
      appBar: AppBar(
        title: Text(room == null ? 'Add Room' : 'Edit Room'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
            )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: GetBuilder<RoomController>(builder: (_) {
            return LinearProgressIndicator(
              color: AppColor.primaryColor,
              backgroundColor: Colors.grey[400],
              minHeight: 3,
              value: roomController.progressValue,
            );
          }),
        ),
      ),
      body: GetBuilder<RoomController>(builder: (_) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 10),
            const Text(
              ' Your Room',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            roomController.progressValue == .5
                ? AddRoomSubScreen1(controller: roomController)
                : AddRoomSubScreen2(
                    roomController: roomController,
                    icons: icons,
                    items: items,
                  ),
          ],
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => isCompleted.value
              ? Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                          label: 'Go Back',
                          onPressed: () {
                            isCompleted.value = false;
                            roomController.updateProgress(isUpdateed: false);
                          }),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: LoadingButton(
                          label: 'Done',
                          showLoading: roomController.showLoading,
                          onPressed: () {
                            roomController.addRoom(
                                isEdit: room == null ? false : true);
                          }),
                    )
                  ],
                )
              : PrimaryButton(
                  label: 'Continue',
                  onPressed: () {
                    if (roomController.validatekey()) {
                      isCompleted.value = true;
                      roomController.updateProgress(isUpdateed: true);
                    }
                  },
                ),

          //  PrimaryButton(
          //     onPressed: () {
          //       if (roomController.validatekey()) {
          //         isCompleted.value = true;
          //         roomController.updateProgress(isUpdateed: true);
          //       }
          //     },
          //     label: 'Continue',
          //   ),
        ),
      ),
    );
  }
}
