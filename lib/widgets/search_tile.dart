
import 'package:east_stay_vendor/model/room_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({
    super.key,
    required this.room,
  });

  final RoomView room;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          Container(
            height: double.maxFinite,
            width: Get.width * .26,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(room.img[0]),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(6)),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                room.vendor.propertyName,
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                '${room.city} ${room.state}',
                style: TextStyle(
                    fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 5),
              Text(
                room.propertyType,
                style: TextStyle(
                    fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
