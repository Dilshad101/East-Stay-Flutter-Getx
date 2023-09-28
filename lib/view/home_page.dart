import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/custom_app_bar.dart';
import 'package:east_stay_vendor/widgets/recent_booking_tile.dart';
import 'package:east_stay_vendor/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../widgets/home_grid_tile.dart';
import '../widgets/room_card_one.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final icons = [
    Icons.currency_rupee,
    Icons.group_outlined,
    Icons.home_max_rounded,
    BoxIcons.bx_notepad
  ];
  final titles = ['Revenue', 'Customers', 'Bookings', 'Rooms'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        physics: const BouncingScrollPhysics(),
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / .5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => HomeGridTile(
              icons: icons,
              titles: titles,
              index: index,
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(title: 'Rooms'),
              Text(
                'View more',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff232323)),
              )
            ],
          ),
          const SizedBox(height: 10),
          // const Row(
          //   children: [RoomCard1(), SizedBox(width: 10), RoomCard1()],
          // ),
          GetBuilder<VendorController>(
            builder: (controller) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.vendorRooms.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.05),
                itemBuilder: (context, index) => const RoomCard1(),
              );
            },
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(title: 'Recent Bookings'),
              Text(
                'View more',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff232323)),
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
