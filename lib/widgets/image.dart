
import 'package:east_stay_vendor/view_model/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadedImages extends StatelessWidget {
  const UploadedImages({
    super.key,
    required this.roomController,
  });

  final RoomController roomController;

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
          itemCount: roomController.urlList!.length,
          itemBuilder: (context, index) {
            final img = roomController.urlList![index];
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
                          image: NetworkImage(img), fit: BoxFit.cover),
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
                          onPressed: () {
                            roomController.urlList!
                                .removeWhere((element) => element == img);
                            roomController.update();
                          },
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
