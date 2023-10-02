import 'dart:convert';

import 'package:east_stay_vendor/model/vendor_model.dart';
import 'package:east_stay_vendor/services/api_services.dart';
import 'package:east_stay_vendor/services/shared_pref.dart';
import 'package:east_stay_vendor/utils/constents/colors.dart';
import 'package:east_stay_vendor/view/loginpage.dart';
import 'package:east_stay_vendor/view/navigation_page.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ScreenSplashScreen extends StatefulWidget {
  const ScreenSplashScreen({super.key});

  @override
  State<ScreenSplashScreen> createState() => _ScreenSplashScreenState();
}

class _ScreenSplashScreenState extends State<ScreenSplashScreen> {
  @override
  void initState() {
    super.initState();
    validateVendor();
  }

  final controller = Get.find<VendorController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          TitleText(title: 'Vendor'),
          SizedBox(width: 15),
        ],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo v2.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
            SizedBox(
                height: MediaQuery.sizeOf(context).height * .10,
                width: MediaQuery.sizeOf(context).height * .10),
            CircularProgressIndicator(
              color: AppColor.primaryColor.withOpacity(.8),
            ),
          ],
        ),
      ),
    );
  }

  void validateVendor() async {
    final token = await SharedPref.instence.getVendor();
    if (token != null) {
      try {
        final response = await Api.instance.getVendorData(token);
        if (response.statusCode == 200) {
          final vendorData = jsonDecode(response.body);
          if (!vendorData['auth']) {
            Get.off(() => ScreenLogin());
            return;
          }
          final vendor = VendorModel.fromJson(vendorData['vendorDetails'])
            ..token = token;
          controller.setVendor(vendor);
          await controller.getVendorRooms();
          Get.off(() => ScreenParent());
        } else {
          Get.off(() => ScreenLogin());
        }
      } catch (e) {
        Get.off(() => ScreenLogin());
      }
    } else {
      Get.off(() => ScreenLogin());
    }
  }
}
