import 'package:cached_network_image/cached_network_image.dart';
import 'package:east_stay_vendor/model/room_model.dart';
import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/custom_key_value_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomGridTile extends StatelessWidget {
  RoomGridTile({
    super.key,
    required this.room,
  });
  final RoomView room;
  final vendor = Get.find<VendorController>().vendor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
              child: CachedNetworkImage(
                imageUrl: room.img[0],
                placeholder: (context, str) => Transform.scale(
                  scale: .5,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 5,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KeyValueText(
                  text1: vendor.value.propertyName,
                  text2: '₹ ${room.price}',
                  fontFamily: 'Ubuntu',
                  size1: 13,
                  size2: 14,
                  color1: Colors.black87,
                  color2: AppColor.primaryColor,
                  fontWeight1: FontWeight.w600,
                  fontWeight2: FontWeight.w600,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: AppColor.textSecondary,
                    ),
                    Expanded(
                      child: Text(
                        room.city,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textSecondary,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
