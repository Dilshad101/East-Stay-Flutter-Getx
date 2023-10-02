import 'package:east_stay_vendor/utils/constents/colors.dart';
import 'package:east_stay_vendor/view_model/navigation_controller.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/custom_app_bar.dart';
import 'package:east_stay_vendor/widgets/home_dash_board.dart';
import 'package:east_stay_vendor/widgets/home_room_cards.dart';
import 'package:east_stay_vendor/widgets/recent_booking_tile.dart';
import 'package:east_stay_vendor/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final vendorController = Get.find<VendorController>();
  @override
  Widget build(BuildContext context) {
    final deviceHieght = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        physics: const BouncingScrollPhysics(),
        children: [
          //Dashboard
          DashBoard(vendorController: vendorController),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleText(title: 'Rooms'),
              GestureDetector(
                onTap: () => Get.find<NavController>().changePage(1),
                child: const Text(
                  'View more',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondaryColor),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          //Rooms
          HomeRooms( deviceHieght: deviceHieght),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleText(title: 'Recent Bookings'),
              GestureDetector(
                onTap: () => Get.find<NavController>().changePage(2),
                child: const Text(
                  'View more',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColor.secondaryColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const RecentBookingTile(),
          const SizedBox(height: 5),
          const RecentBookingTile(),
          const SizedBox(height: 5),
          const RecentBookingTile(),
        ],
      ),
    );
  }
}
