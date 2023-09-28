import 'package:east_stay_vendor/view_model/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../widgets/custom_text_field.dart';

class SignupSubPageVendor extends StatelessWidget {
  const SignupSubPageVendor({super.key, required this.controller});
  final RegistrationController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Form(
        key: controller.vendorFormKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            CustomTextField(
              label: 'Name',
              icon: Icons.person_outline_rounded,
              controller: controller.nameController,
              validator: (value) {
                return controller.validateName(value!);
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Email',
              icon: Icons.email_outlined,
              controller: controller.emailController,
              validator: (value) => controller.validateEmail(value!),
              keyboard: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Password',
              icon: Icons.lock_outline_rounded,
              controller: controller.passwordController,
              isPassword: T,
              validator: (value) => controller.validatePassword(value!),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Confirm Password',
              icon: Icons.lock_outline_rounded,
              isPassword: T,
              controller: controller.confirmPassController,
              validator: (value) => controller.validateConfirmPass(value!),
            ),
          ],
        ),
      ),
    );
  }
}
