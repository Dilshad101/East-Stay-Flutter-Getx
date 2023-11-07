import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view_model/profile_controller.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/custom_text_field.dart';
import 'package:east_stay_vendor/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ScreenEditProfile extends StatelessWidget {
  ScreenEditProfile({super.key});
  final profileController = Get.put(ProfileController());
  final vondorController = Get.find<VendorController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
            )),
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: double.maxFinite,
          child: Form(
            key: profileController.editFormKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                    radius: 75,
                    backgroundColor: AppColor.backgroundColor,
                    child: Stack(
                      children: [
                        //profile image
                        GetBuilder<ProfileController>(
                          builder: (controller) => CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey[400],
                              backgroundImage: controller.profileImage != null
                                  ? FileImage(controller.profileImage!)
                                  : vondorController.vendor.value.image != null
                                      ? NetworkImage(vondorController
                                          .vendor.value.image!) as ImageProvider
                                      : null,
                              child: vondorController.vendor.value.image == null
                                  ? profileController.profileImage == null
                                      ? const Icon(
                                          Icons.person_2,
                                          size: 40,
                                          color: Colors.grey,
                                        )
                                      : null
                                  : null),
                        ),

                        Positioned(
                          right: 0,
                          bottom: 0,
                          // circular button
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColor.textPrimary,
                            child: CircleAvatar(
                                radius: 17,
                                backgroundColor: AppColor.backgroundColor,
                                child: IconButton(
                                    onPressed: () => getProfileImage(),
                                    icon: Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 18,
                                      color: Colors.grey[800],
                                    ))),
                          ),
                        )
                      ],
                    )),
                const SizedBox(height: 30),
                CustomTextField(
                  label: 'Name',
                  icon: Icons.person,
                  controller: profileController.nameController,
                  validator: (value) => profileController.isEmpty(value!),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  label: 'Email',
                  icon: Icons.mail_outline_outlined,
                  controller: profileController.emailController,
                  validator: (value) => profileController.isEmail(value!),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  label: 'Property Name',
                  icon: Icons.home_work_outlined,
                  controller: profileController.propertyController,
                  validator: (value) => profileController.isEmpty(value!),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  label: 'Property Location',
                  icon: Icons.call_outlined,
                  controller: profileController.locationController,
                  validator: (value) => profileController.isEmpty(value!),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: PrimaryButton(
            onPressed: () => profileController.updateUserInfo(), label: 'Done'),
      ),
    );
  }

  void getProfileImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileController.setProfileImage(image);
    }
  }
}
