import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Amenities extends StatelessWidget {
  const Amenities({
    super.key,
    required this.amenities,
  });
  final List<String> amenities;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: amenities.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) => Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff939393), width: .5),
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(Get.find<VendorController>().amenities[amenities[index]]),
            const SizedBox(height: 5),
            Text(amenities[index],
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
    );
  }
}
