// ignore_for_file: must_be_immutable

import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view/loginpage.dart';
import 'package:east_stay_vendor/view_model/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/custom_button.dart';
import '../widgets/primary_button.dart';
import 'signup_subpage_property.dart';
import 'signup_subpage_vendor.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});
  final PageController pageController = PageController();
  // final namecontroller = TextEditingController();
  // final emailcontroller = TextEditingController();
  // final passworedcontroller = TextEditingController();
  // final confirmPasswordcontroller = TextEditingController();
  bool showGoBack = false;
  final controller = Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    final deviceHeight =
        MediaQuery.sizeOf(context).height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: deviceHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Vendor',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .25,
                  width: double.maxFinite,
                  child: SvgPicture.asset(
                    'assets/images/logo v2.svg',
                    height: 85,
                    width: 185,
                    fit: BoxFit.none,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Vendor Registration',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColor.secondaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.off(() => ScreenLogin());
                      },
                      child: const Text.rich(
                        TextSpan(children: [
                          TextSpan(text: 'Have an account '),
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue))
                        ]),
                        style:
                            TextStyle(fontSize: 11, color: Color(0xff7A7A7A)),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                const Divider(
                    height: 1, color: AppColor.textPrimary, thickness: 1),
                const SizedBox(height: 15),
//Sub pages
                Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SignupSubPageVendor(controller: controller),
                      SignupSubPageProperty(controller: controller),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 2,
                    effect: const ScrollingDotsEffect(
                        activeDotColor: AppColor.primaryColor,
                        dotHeight: 10,
                        dotWidth: 10),
                  ),
                ),
                const SizedBox(height: 20),
                StatefulBuilder(
                  builder: (context, setstate) {
                    return showGoBack == false
                        ? PrimaryButton(
                            label: 'Continue',
                            onPressed: () {
                              if (controller.vendorFormKey.currentState!
                                  .validate()) {
                                pageController.nextPage(
                                    duration: const Duration(milliseconds: 600),
                                    curve: Curves.easeInOut);
                                setstate(() => showGoBack = true);
                              }
                            },
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  label: 'Go Back',
                                  onPressed: () {
                                    pageController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 600),
                                        curve: Curves.easeInOut);
                                    setstate(() => showGoBack = false);
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 2,
                                child: PrimaryButton(
                                    onPressed: () =>
                                        controller.validateVendor(),
                                    label: 'Register'),
                              ),
                            ],
                          );
                  },
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
