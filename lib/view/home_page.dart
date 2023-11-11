import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view/drawer_page.dart';
import 'package:east_stay_vendor/view_model/navigation_controller.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/home_dash_board.dart';
import 'package:east_stay_vendor/widgets/home_room_cards.dart';
import 'package:east_stay_vendor/widgets/recent_booking_tile.dart';
import 'package:east_stay_vendor/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final vendorController = Get.find<VendorController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      drawerEnableOpenDragGesture: true,
      appBar: appBar(),
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
                onTap: () => Get.find<NavController>().changePage(2),
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
          const HomeRooms(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleText(title: 'Recent Bookings'),
              GestureDetector(
                onTap: () => Get.find<NavController>().changePage(3),
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
          recentBookings()
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      actions: [
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
          child: SvgPicture.asset(
            'assets/images/logo v2.svg',
            colorFilter: const ColorFilter.mode(
                AppColor.primaryColor, BlendMode.srcIn),
            alignment: Alignment.centerRight,
          ),
        ),
      ],
    );
  }

  Widget recentBookings() {
    return GetBuilder<VendorController>(
      builder: (controller) => controller.bookedRooms.isEmpty
          ? const SizedBox(
              height: 180,
              child: Center(
                  child: Text(
                "You don't have any Bookings",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  wordSpacing: 2,
                ),
              )),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  RecentBookingTile(bookedRoom: controller.bookedRooms[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: controller.bookedRooms.length < 4
                  ? controller.bookedRooms.length
                  : 4,
            ),
    );
  }
}
