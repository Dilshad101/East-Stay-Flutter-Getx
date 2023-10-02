import 'package:east_stay_vendor/utils/constents/colors.dart';
import 'package:east_stay_vendor/view/booked_room_details_page.dart';
import 'package:east_stay_vendor/widgets/booked_room_detail_tile.dart';
import 'package:east_stay_vendor/widgets/custom_key_value_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenBookingDetails extends StatelessWidget {
  const ScreenBookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Details"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.black87,
              )),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: const [
            BookingDetailsTile()
          ],
        ),
      ),
    );
  }
}
