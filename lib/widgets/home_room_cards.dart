import 'package:east_stay_vendor/model/room_model.dart';
import 'package:east_stay_vendor/model/vendor_model.dart';
import 'package:east_stay_vendor/utils/constents/colors.dart';
import 'package:east_stay_vendor/view/room_details_page.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRooms extends StatelessWidget {
  const HomeRooms({
    super.key,
    required this.deviceHieght,
  });

  final double deviceHieght;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorController>(
      builder: (controller) {
        return controller.vendorRooms.isEmpty
            ? Container(
                height: deviceHieght * .20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Center(
                    child: Text(
                  'You Haven\'t Added any Rooms',
                  style: TextStyle(
                    color: Colors.grey[600],
                    letterSpacing: .8,
                  ),
                )),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.vendorRooms.length > 2
                    ? 2
                    : controller.vendorRooms.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.05),
                itemBuilder: (context, index) => roomCard(
                  context: context,
                  room: controller.vendorRooms[index],
                  vendor: controller.vendor,
                ),
              );
      },
    );
  }

  GestureDetector roomCard(
      {required BuildContext context,
      required Rx<RoomView> room,
      required Rx<VendorModel> vendor}) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ScreenRoomDetails(room: room));
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * .22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * .13,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6)),
                    color: Colors.yellow,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    vendor.value.propertyName,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: Color(0xFF616161),
                      ),
                      Text(
                        room.value.city,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF616161),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              left: 20,
              top: MediaQuery.sizeOf(context).height * .12,
              child: Container(
                height: 20,
                width: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.primaryColor,
                ),
                child: Text(
                  " ₹${room.value.price}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Ubuntu',
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
