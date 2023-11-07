
import 'package:cached_network_image/cached_network_image.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorProfile extends StatelessWidget {
   VendorProfile({
    super.key,
  });

 
  final vendor = Get.find<VendorController>().vendor;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey[400]),
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(6),
              child: vendor.value.image == null
                  ? const Icon(
                      Icons.person_2,
                      size: 40,
                      color: Colors.grey,
                    )
                  : CachedNetworkImage(
                      width: double.maxFinite,
                      imageUrl: vendor.value.image!,
                      placeholder: (context, url) => Transform.scale(
                          scale: .1,
                          child: const CircularProgressIndicator(
                            strokeWidth: 15,
                            color: Colors.black,
                          )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            vendor.value.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
