import 'package:east_stay_vendor/utils/constents/colors.dart';
import 'package:east_stay_vendor/view/booked_room_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_key_value_text.dart';

class BookingDetailsTile extends StatelessWidget {
  const BookingDetailsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const ScreenBookedRoomDetails()),
      child: Container(
        height: 110,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.white),
        child: Column(
          children: [
            SizedBox(
              height: 90,
              width: double.maxFinite,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * .30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade300),
                  ),
                  const SizedBox(width: 5),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KeyValueText(
                          text1: 'Customer',
                          text2: 'James',
                          size1: 13,
                          size2: 13,
                          color1: AppColor.textPrimary,
                          color2: AppColor.primaryColor,
                          fontWeight1: FontWeight.w600,
                          fontWeight2: FontWeight.w500,
                        ),
                        SizedBox(height: 2),
                        KeyValueText(
                          text1: 'Check in',
                          text2: '10-9-2023',
                          size1: 13,
                          size2: 11.5,
                          color1: AppColor.textPrimary,
                          color2: AppColor.textSecondary,
                          fontWeight1: FontWeight.w600,
                          fontWeight2: FontWeight.w500,
                        ),
                        SizedBox(height: 2),
                        KeyValueText(
                          text1: 'Check out',
                          text2: '12-9-2023',
                          size1: 13,
                          size2: 11.5,
                          color1: AppColor.textPrimary,
                          color2: AppColor.textSecondary,
                          fontWeight1: FontWeight.w600,
                          fontWeight2: FontWeight.w500,
                        ),
                        SizedBox(height: 2),
                        KeyValueText(
                          text1: 'Room rent',
                          text2: '₹ 1300',
                          fontFamily: 'Ubuntu',
                          size1: 13,
                          size2: 13,
                          color1: AppColor.textPrimary,
                          color2: Colors.black87,
                          fontWeight1: FontWeight.w600,
                          fontWeight2: FontWeight.w600,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
