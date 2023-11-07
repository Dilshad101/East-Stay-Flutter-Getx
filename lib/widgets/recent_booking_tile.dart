import 'package:east_stay_vendor/model/booking_model.dart';
import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view/booked_room_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class RecentBookingTile extends StatelessWidget {
  const RecentBookingTile({super.key, required this.bookedRoom});
  final BookedRoomModel bookedRoom;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.to(() => ScreenBookedRoomDetails(bookedRoom: bookedRoom)),
      child: Container(
        height: MediaQuery.sizeOf(context).height * .10,
        constraints: const BoxConstraints(minHeight: 90),
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(bookedRoom.room.img[0]))),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          bookedRoom.room.vendor.propertyName,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Text(
                        '₹ ${bookedRoom.totalAmount}',
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Ubuntu',
                            color: AppColor.primaryColor),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: AppColor.textSecondary,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(bookedRoom.user.name,
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColor.textSecondary,
                                overflow: TextOverflow.ellipsis)),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Row(
                    children: [
                      const Icon(
                        LineAwesome.calendar_check,
                        size: 14,
                        color: AppColor.textSecondary,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        bookedRoom.checkIn,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColor.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
