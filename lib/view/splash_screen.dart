import 'package:east_stay_vendor/model/vendor_model.dart';
import 'package:east_stay_vendor/services/api_services.dart';
import 'package:east_stay_vendor/services/shared_pref.dart';
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
              width: MediaQuery.sizeOf(context).height * .10
            ),
              CircularProgressIndicator(
               color: const Color(0xffE55959).withOpacity(.8),
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
        final vendorData = await Api.instance.getVendorData(token);
        if (!vendorData['auth']) {
          Get.off(() => ScreenLogin());
        }
        final vendor = VendorModel.fromJson(vendorData['vendorDetails'])
          ..token = token;
         Get.find<VendorController>().setVendor(vendor);
        Get.off(() => ScreenParent());
      } catch (e) {
        Get.off(() => ScreenLogin());
      }
    } else {
      Get.off(() => ScreenLogin());
    }
  }
}
