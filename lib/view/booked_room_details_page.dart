import 'package:east_stay_vendor/model/booking_model.dart';
import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/widgets/divider_text.dart';
import 'package:east_stay_vendor/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_key_value_text.dart';

class ScreenBookedRoomDetails extends StatelessWidget {
  const ScreenBookedRoomDetails({super.key, required this.bookedRoom});
  final BookedRoomModel bookedRoom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 0),
        children: [
          roomImage(context),
          const SizedBox(height: 15),
          bookingDetails()
        ],
      ),
    );
  }

  Padding bookingDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(
            title: 'Customer Details',
          ),
          const SizedBox(height: 15),
          Dividertext(
            title: 'Name',
            subtilte: bookedRoom.user.name,
          ),
          Dividertext(
            title: 'Address',
            subtilte: bookedRoom.address,
          ),
          Dividertext(
            title: 'Mobile Number',
            subtilte: bookedRoom.phone.toString(),
          ),
          const SizedBox(height: 10),
          const TitleText(title: 'Booking Details'),
          const SizedBox(height: 10),
          KeyValueText(
            text1: 'Booking ID',
            text2: bookedRoom.id,
            size1: 14,
            size2: 12,
            color1: AppColor.textPrimary,
            color2: AppColor.textPrimary,
          ),
          KeyValueText(
            text1: 'Check in',
            text2: bookedRoom.checkIn,
            size1: 14,
            size2: 12,
            color1: AppColor.textPrimary,
            color2: AppColor.textPrimary,
          ),
          KeyValueText(
            text1: 'Check out',
            text2: bookedRoom.checkOut,
            size1: 14,
            size2: 12,
            color1: AppColor.textPrimary,
            color2: AppColor.textPrimary,
          ),
          KeyValueText(
            text1: 'Total Guest',
            text2: bookedRoom.adult.toString(),
            size1: 14,
            size2: 12,
            color1: AppColor.textPrimary,
            color2: AppColor.textPrimary,
          ),
          KeyValueText(
            text1: 'Total Room',
            text2: bookedRoom.totalRoom.toString(),
            size1: 14,
            size2: 12,
            color1: AppColor.textPrimary,
            color2: AppColor.textPrimary,
          ),
          KeyValueText(
            text1: 'Room Rent',
            text2: bookedRoom.room.price.toString(),
            size1: 14,
            size2: 12,
            color1: AppColor.textPrimary,
            color2: AppColor.textPrimary,
          ),
          KeyValueText(
            text1: 'Duration',
            text2: '${bookedRoom.days} Days',
            size1: 14,
            size2: 12,
            color1: AppColor.textPrimary,
            color2: AppColor.textPrimary,
          ),
          KeyValueText(
            text1: 'Total Amount',
            text2: '₹ ${bookedRoom.totalAmount}',
            size1: 14,
            size2: 12,
            color1: AppColor.textPrimary,
            color2: AppColor.textPrimary,
            fontFamily: 'Ubuntu',
          )
        ],
      ),
    );
  }

  Container roomImage(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .36,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20, left: 20),
      decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: NetworkImage(bookedRoom.room.img[0]),
            fit: BoxFit.cover,
          )),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 23,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
