import 'package:east_stay_vendor/view/room_details_page.dart';
import 'package:east_stay_vendor/widgets/room_grid_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenRooms extends StatelessWidget {
  const ScreenRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Rooms'),
        actions: [
          CircleAvatar(
            radius: 21,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              backgroundColor: const Color(0xffEDEFF0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search_rounded, color: Colors.black87),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: const Color(0xffE55959),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: 15,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Get.to(const ScreenRoomDetails(),
              transition: Transition.cupertinoDialog),
          child: const RoomGridTile(),
        ),
      ),
    );
  }
}
