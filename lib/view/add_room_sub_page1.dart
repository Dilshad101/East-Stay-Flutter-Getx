import 'package:east_stay_vendor/view_model/room_controller.dart';
import 'package:east_stay_vendor/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddRoomSubScreen1 extends StatelessWidget {
  const AddRoomSubScreen1({
    super.key,
    required this.controller,
  });
  final RoomController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.roomkey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Property Type',
            hint: 'Hotel / appartment ...',
            controller: controller.propertyType,
            validator: (value) => controller.isEmpty(value!),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Room Rent',
            keyboard: TextInputType.number,
            controller: controller.roomRentController,
            validator: (value) => controller.isNumber(value!),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: 'Total Rooms',
                  keyboard: TextInputType.number,
                  controller: controller.totalRoomController,
                  validator: (value) => controller.isNumber(value!),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextField(
                  label: 'Capacity',
                  controller: controller.capacityController,
                  keyboard: TextInputType.number,
                  validator: (value) => controller.isNumber(value!),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Address',
            maxLines: 3,
            controller: controller.addressController,
            keyboard: TextInputType.streetAddress,
            validator: (value) => controller.isEmpty(value!),
            action: TextInputAction.newline,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Description',
            maxLines: 3,
            controller: controller.descriptionController,
            validator: (value) => controller.isEmpty(value!),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'State',
            controller: controller.stateController,
            validator: (value) => controller.isEmpty(value!),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: 'City',
                  keyboard: TextInputType.number,
                  controller: controller.cityController,
                  validator: (value) => controller.isEmpty(value!),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextField(
                  label: 'Zip',
                  keyboard: TextInputType.number,
                  controller: controller.zipController,
                  validator: (value) => controller.isNumber(value!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
