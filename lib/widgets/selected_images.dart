import 'dart:io';

import 'package:east_stay_vendor/view_model/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedImages extends StatelessWidget {
  SelectedImages({
    super.key,
  });

  final RoomController roomController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomController>(
      builder: (_) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: roomController.images.length,
          itemBuilder: (context, index) {
            final img = roomController.images[index];
            return Stack(
              children: [
                const SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey[400],
                      image: DecorationImage(
                          image: FileImage(
                            File(img.path),
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.black,
                      child: IconButton(
                          onPressed: () => roomController.removeImage(img),
                          icon: const Icon(
                            Icons.close,
                            size: 15,
                          )),
                    ))
              ],
            );
          },
        );
      },
    );
  }
}
