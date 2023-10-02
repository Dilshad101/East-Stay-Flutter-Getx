import 'package:east_stay_vendor/view/coupon_page.dart';
import 'package:east_stay_vendor/view/loginpage.dart';
import 'package:east_stay_vendor/view/profile_page.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/custom_popup.dart';
import 'package:east_stay_vendor/widgets/custom_settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSettings extends StatelessWidget {
  ScreenSettings({super.key});
  final vendor = Get.find<VendorController>().vendor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                Container(
                  height: 90,
                  width: 100,
                  margin: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 10),
                Obx(
                  () => Text(
                    vendor.value.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            CustomSettingsTile(
              title: "Your Profile",
              ontap: () {
                Get.to(() => ScreenProfile(), transition: Transition.topLevel);
              },
              icon: Icons.person_outline_rounded,
            ),
            const SizedBox(height: 10),
            CustomSettingsTile(
              title: "Coupons",
              ontap: () {
                Get.to(() => ScreenCoupon(), transition: Transition.topLevel);
              },
              icon: Icons.sell_outlined,
            ),
            const SizedBox(height: 10),
            CustomSettingsTile(
              title: "App Info",
              ontap: () {},
              icon: Icons.info_outline,
            ),
            const SizedBox(height: 10),
            CustomSettingsTile(
              title: "Privacy Policy",
              ontap: () {},
              icon: Icons.lock_outline_rounded,
            ),
            const SizedBox(height: 10),
            CustomSettingsTile(
              title: "Terms & condition",
              ontap: () {},
              icon: Icons.verified_user_outlined,
            ),
            const SizedBox(height: 10),
            CustomSettingsTile(
              title: "Sign out",
              ontap: () {
                showPopup(
                  title: 'Sign out',
                  subtitle: 'Sign out your account',
                  buttonText: 'Sign out',
                  onProceed: () {
                    Get.offUntil(
                      MaterialPageRoute(builder: (_) => ScreenLogin()),
                      (route) => false,
                    );
                  },
                  onCancelled: () => Get.back(),
                );
              },
              icon: Icons.logout_rounded,
              removeArrow: true,
            ),
          ],
        ),
      ),
    );
  }
}
