import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:east_stay_vendor/model/room_model.dart';
import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view/add_edit_room_page.dart';
import 'package:east_stay_vendor/view_model/room_controller.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/button_more.dart';
import 'package:east_stay_vendor/widgets/custom_key_value_text.dart';
import 'package:east_stay_vendor/widgets/custom_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widgets/amenities.dart';

class ScreenRoomDetails extends StatelessWidget {
  ScreenRoomDetails({super.key, required this.room});
  final Rx<RoomView> room;
  final vendor = Get.find<VendorController>().vendor;
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => ListView(
              padding: const EdgeInsets.symmetric(vertical: 0),
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * .4,
                  width: double.maxFinite,
                  color: Colors.grey[300],
                  child: Swiper(
                    itemCount: 4,
                    itemBuilder: (context, index) => CachedNetworkImage(
                      imageUrl: room.value.img[index],
                      fit: BoxFit.cover,
                      placeholder: (context, str) => Transform.scale(
                        scale: .1,
                        child: const CircularProgressIndicator(
                          color: Colors.grey,
                          strokeWidth: 10,
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                    ),
                    pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          activeColor: AppColor.primaryColor,
                          color: Color(0xFFE0E0E0),
                          activeSize: 11,
                          space: 4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    vendor.value.propertyName,
                    style: const TextStyle(
                        fontSize: 22,
                        color: AppColor.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    room.value.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColor.textPrimary,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(thickness: 1, color: Color(0xFFE0E0E0)),
                // const Divider(height: 1, thickness: 6, color: Color(0xffD9D9D9)),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Amenities',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Amenities(amenities: room.value.amenities),
                const SizedBox(height: 15),
                const Divider(thickness: 1, color: Color(0xFFE0E0E0)),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Room info',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      KeyValueText(
                        text1: 'Location',
                        text2: '${room.value.city} ${room.value.state}',
                        size1: 14,
                        size2: 12,
                        color1: AppColor.textPrimary,
                        color2: AppColor.textSecondary,
                      ),
                      const SizedBox(height: 5),
                      KeyValueText(
                        text1: 'Property Type',
                        text2: room.value.propertyType,
                        size1: 14,
                        size2: 12,
                        color1: AppColor.textPrimary,
                        color2: AppColor.textSecondary,
                      ),
                      const SizedBox(height: 5),
                      KeyValueText(
                        text1: 'Room Type',
                        text2: room.value.category,
                        size1: 14,
                        size2: 12,
                        color1: AppColor.textPrimary,
                        color2: AppColor.textSecondary,
                      ),
                      const SizedBox(height: 5),
                      KeyValueText(
                        text1: 'Capacity',
                        text2: room.value.capacity,
                        size1: 14,
                        size2: 12,
                        color1: AppColor.textPrimary,
                        color2: AppColor.textSecondary,
                      ),
                      const SizedBox(height: 5),
                      KeyValueText(
                        text1: 'Total Rooms',
                        text2: room.value.totalRooms,
                        size1: 14,
                        size2: 12,
                        color1: AppColor.textPrimary,
                        color2: AppColor.textSecondary,
                      ),
                      const SizedBox(height: 5),
                      KeyValueText(
                        text1: 'Room Rate',
                        text2: '₹ ${room.value.price}',
                        size1: 14,
                        size2: 14,
                        color1: AppColor.textPrimary,
                        color2: Colors.black,
                        fontFamily: 'Ubuntu',
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: MediaQuery.sizeOf(context).height * .05,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: MediaQuery.sizeOf(context).height * .05,
            child: Material(
              borderRadius: BorderRadius.circular(50),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: MoreButton(
                  text1: 'Edit',
                  text2: 'Delete',
                  icon1: Icons.edit,
                  icon2: Icons.delete,
                  onSelected: (value) {
                    if (value == 1) {
                      showPopup(
                          title: 'Edit',
                          subtitle: 'Do you want to Edit this room ?',
                          buttonText: 'Edit',
                          onProceed: () {
                            Get.back();
                            Get.to(() => ScreenAddRoom(room: room));
                          },
                          onCancelled: () => Get.back());
                    }
                    if (value == 2) {
                      showPopup(
                          title: 'Delete',
                          subtitle: 'Do you want to delete this room ?',
                          buttonText: 'Delete',
                          onProceed: () {
                            Get.back();
                            Get.put(RoomController())
                                .deleteRoom(room.value.id);
                          },
                          onCancelled: () => Get.back());
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
