import 'package:east_stay_vendor/view/signup_page.dart';
import 'package:east_stay_vendor/view_model/login_controller.dart';
import 'package:east_stay_vendor/widgets/custom_text_field.dart';
import 'package:east_stay_vendor/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final namecontroller = TextEditingController();
  final passworedcontroller = TextEditingController();
  final controller = Get.put(LoginController());
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
                  height: MediaQuery.sizeOf(context).height * .30,
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
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff232323),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.off(() => ScreenSignUp());
                      },
                      child: const Text.rich(
                        TextSpan(children: [
                          TextSpan(text: 'Don\'t have an account '),
                          TextSpan(
                              text: 'Register',
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
                    height: 1, color: Color(0xff484848), thickness: 1),
                const SizedBox(height: 30),
                Expanded(
                  child: Form(
                    key: controller.loginKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            label: 'Email',
                            icon: Icons.email_outlined,
                            keyboard: TextInputType.emailAddress,
                            controller: controller.emailController,
                            validator: (value) =>
                                controller.validateEmail(value!)),
                        const SizedBox(height: 15),
                        CustomTextField(
                          label: 'Password',
                          controller: controller.passwordController,
                          validator: (value) =>
                              controller.validatePassword(value!),
                          icon: Icons.lock_outline_rounded,
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                ),
                LoadingButton(
                  label: 'Continue',
                  showLoading: controller.showLoading,
                  onPressed: () {
                    controller.validateLogin();
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
