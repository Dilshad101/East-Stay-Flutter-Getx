import 'package:east_stay_vendor/view/edit_profile_page.dart';
import 'package:east_stay_vendor/widgets/divider_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        title: const Text('Your Profile'),
        actions: [
          IconButton(
            onPressed: () =>Get.to(()=> ScreenEditProfile()),
            icon: const Icon(
              BoxIcons.bx_pencil,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Personal Details',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          const Dividertext(title: 'Name', subtilte: 'Robert'),
          const SizedBox(height: 6),
          const Dividertext(title: 'Email', subtilte: 'robert@gmail.com'),
          const SizedBox(height: 6),
          const Dividertext(title: 'Contact', subtilte: '90807067'),
          const SizedBox(height: 20),
          const Text('Property Details',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Dividertext(title: 'name', subtilte: 'Hotel Paragon'),
          const SizedBox(height: 6),
          const Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Dividertext(title: 'Total Rooms', subtilte: '10'),
                ),
              ),
              Expanded(
                child: Dividertext(title: 'Total Booking', subtilte: '15'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
