import 'package:east_stay_vendor/services/shared_pref.dart';
import 'package:east_stay_vendor/view/app_info_screen.dart';
import 'package:east_stay_vendor/view/coupon_page.dart';
import 'package:east_stay_vendor/view/loginpage.dart';
import 'package:east_stay_vendor/view/privacy_policy_page.dart';
import 'package:east_stay_vendor/view/profile_page.dart';
import 'package:east_stay_vendor/view/terms_and_condition.dart';
import 'package:east_stay_vendor/widgets/custom_popup.dart';
import 'package:east_stay_vendor/widgets/custom_settings_tile.dart';
import 'package:east_stay_vendor/widgets/vendor_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const SizedBox(height: 40),
            VendorProfile(),
            const SizedBox(height: 20),
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
              ontap: () {
                Get.to(() => const ScreenAppInfo(),
                    transition: Transition.topLevel);
              },
              icon: Icons.info_outline,
            ),
            const SizedBox(height: 10),
            CustomSettingsTile(
              title: "Privacy Policy",
              ontap: () {
                Get.to(() => const ScreenPrivacyPolicy(),
                    transition: Transition.topLevel);
              },
              icon: Icons.lock_outline_rounded,
            ),
            const SizedBox(height: 10),
            CustomSettingsTile(
              title: "Terms & condition",
              ontap: () => Get.to(() => const ScreenTermsAndConditions()),
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
                    SharedPref.instence.signout();
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
