import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/booked_room_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenBookingDetails extends StatelessWidget {
  const ScreenBookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booking Details")),
      body: GetBuilder<VendorController>(
        builder: (controller) => controller.bookedRooms.isEmpty
            ? const Center(
                child: Text(
                "You don't have any Bookings",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ))
            : ListView.separated(
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) => BookingDetailsTile(
                    bookedRoom: controller.bookedRooms[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: controller.bookedRooms.length,
              ),
      ),
    );
  }
}
