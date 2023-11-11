import 'package:east_stay_vendor/utils/strings/app_privacy_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenPrivacyPolicy extends StatelessWidget {
  const ScreenPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: Colors.black)),
          title: const Text('Privacy Policy')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          title('Information we collect'),
          const SizedBox(height: 10),
          policies('Account information', AppPrivacy.accountInfo),
          policies('Hotel Details', AppPrivacy.hotelInfo),
          const SizedBox(height: 10),
          title('How we Use your Information'),
          const SizedBox(height: 10),
          policies('Hotel Listing', AppPrivacy.hotelListing),
          policies('Communication', AppPrivacy.communications),
          const SizedBox(height: 10),
          title('Information Sharing'),
          const SizedBox(height: 10),
          policies('Public Display', AppPrivacy.publicDisplay),
          policies('Service Providers', AppPrivacy.serviceProvider),
          const SizedBox(height: 10),
          title('Security Measures'),
          const SizedBox(height: 10),
          description(AppPrivacy.security),
          const SizedBox(height: 10),
          title('Updates'),
          const SizedBox(height: 10),
          description(AppPrivacy.updates),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Text description(String desc) => Text(
        desc,
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey[600]),
      );

  Column policies(String policy, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(policy,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800])),
        const SizedBox(height: 4),
        Text(description,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600])),
        const SizedBox(height: 10)
      ],
    );
  }

  Text title(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16, color: Colors.grey[900], fontWeight: FontWeight.w600),
    );
  }
}
