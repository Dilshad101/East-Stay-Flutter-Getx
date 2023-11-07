import 'package:east_stay_vendor/view_model/registration_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class SignupSubPageProperty extends StatelessWidget {
  const SignupSubPageProperty({super.key, required this.controller});
  final RegistrationController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Form(
        key: controller.propertyFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextField(
              controller: controller.propertyNameController,
              validator: (value) => controller.validatePropertyName(value!),
              label: 'Property Name',
              icon: Icons.person_outline_rounded,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: controller.propertyLocationController,
              validator: (value) => controller.validatePropertyName(value!),
              label: 'Property Location',
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: controller.mobileController,
              validator: (value) => controller.validateNumber(value!),
              label: 'Mobile Number',
              keyboard: TextInputType.phone,
              icon: Icons.lock_outline_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
