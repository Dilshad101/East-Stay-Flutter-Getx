import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({
    super.key,
    required this.vendorController,
  });

  final VendorController vendorController;

  @override
  Widget build(BuildContext context) {
    final dashBoard = vendorController.dashBoard;
    return GetBuilder<VendorController>(builder: (controller) {
      return Column(
        children: [
          Row(
            children: [
              gridTile(
                icon: Icons.currency_rupee,
                title: "Revenue",
                data: dashBoard['revenue'] ?? '0',
                context: context,
              ),
              const SizedBox(width: 10),
              gridTile(
                icon: Icons.group_outlined,
                title: "Customers",
                data: dashBoard['customer'] ?? '0',
                context: context,
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              gridTile(
                icon: BoxIcons.bx_notepad,
                title: "Bookings",
                data: dashBoard['Bookings'] ?? '0',
                context: context,
              ),
              const SizedBox(width: 10),
              gridTile(
                icon: Icons.home_max_rounded,
                title: "Rooms",
                data: vendorController.vendorRooms.length.toString(),
                context: context,
              )
            ],
          ),
        ],
      );
    });
  }

  Expanded gridTile(
      {required IconData icon,
      required String title,
      required String data,
      required BuildContext context}) {
    return Expanded(
      child: Container(
        height: MediaQuery.sizeOf(context).height * .10,
        constraints: const BoxConstraints(minHeight: 80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffFFE1E1),
              child: Icon(
                icon,
                color: Colors.black.withOpacity(.8),
                size: 22,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondaryColor),
                ),
                Text(
                  data,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.secondaryColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
