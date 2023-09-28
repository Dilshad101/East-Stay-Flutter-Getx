
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownButton extends StatelessWidget {
  const DropDownButton({
    super.key,
    required this.selectedCategory,
  });

  final Rx<String> selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.only(left: 10, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey[400]!, width: 1),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            value: selectedCategory.value,
            isExpanded: true,
            onChanged: (String? newValue) {
              selectedCategory.value = newValue ?? '';
            },
            items: const [
              DropdownMenuItem(value: 'Classic', child: Text('Classic')),
              DropdownMenuItem(value: 'Luxury', child: Text('Luxury')),
              DropdownMenuItem(value: 'Deluxe', child: Text('Deluxe')),
              DropdownMenuItem(value: 'Elite ', child: Text('Elite')),
            ],
          ),
        ),
      ),
    );
  }
}
