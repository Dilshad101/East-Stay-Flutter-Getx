
import 'package:east_stay_vendor/utils/strings/app_info_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAppInfo extends StatelessWidget {
  const ScreenAppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(AppInfo.welcome,
              style: TextStyle(fontSize: 12, color: Colors.grey[700])),
          const SizedBox(height: 20),
          title('Key Features'),
          info('Room Management', AppInfo.roomManagement),
          info('Booking Platform', AppInfo.bookingPlatforme),
          info('Integrated Map', AppInfo.integratedMap),
          info('Revenue Tracking', AppInfo.revenueTracking),
          info('Coupon Management', AppInfo.couponManagement),
          const SizedBox(height: 10),
          title('How It Works'),
          info('Room Listing', AppInfo.roomListing),
          info('Booking Management', AppInfo.bookingManagement),
          info('Revenue Insights', AppInfo.revenueInsights),
          info('Coupon Campaigns', AppInfo.couponCampaign),
          info('Contact Us', AppInfo.contact),
          const SizedBox(height: 10),
          const Text(
            'Thank you for choosing EastStay-Vendor  Your Partner in Hotel Management',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Column title(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
      ],
    );
  }

  Column info(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800])),
        const SizedBox(height: 6),
        Text(
          description,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
