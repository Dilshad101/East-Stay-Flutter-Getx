
import 'package:east_stay_vendor/view_model/room_controller.dart';
import 'package:east_stay_vendor/widgets/drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRoomSubScreen2 extends StatelessWidget {
  const AddRoomSubScreen2({
    super.key,
    required this.roomController,
    required this.icons,
    required this.items,
  });

  final RoomController roomController;
  final List<IconData> icons;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('select room Amenities',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        GetBuilder<RoomController>(
          builder: (_) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1 / .9,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  roomController.updateAmenities(
                      index: index,
                      isAdd: !roomController.selectedAmenities.contains(index));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(6),
                    color: roomController.selectedAmenities.contains(index)
                        ? const Color(0xff232323)
                        : Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        icons[index],
                        size: 25,
                        color: roomController.selectedAmenities.contains(index)
                            ? Colors.white
                            : const Color(0xff232323),
                      ),
                      Text(
                        items[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: .8,
                          color:
                              roomController.selectedAmenities.contains(index)
                                  ? Colors.white
                                  : const Color(0xff232323),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        const Text('Category',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        DropDownButton(selectedCategory: roomController.selectedCategory),
        const SizedBox(height: 20),
        const Text('Upload Room Pictures',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        GetBuilder<RoomController>(
          builder: (_) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: roomController.uploadedImages.length < 4
                  ? roomController.uploadedImages.length + 1
                  : 4,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey,
                ),
                child: index == roomController.uploadedImages.length
                    ? GestureDetector(
                        onTap: () {
                          roomController.updateImageList(
                              imagePath: 'aaa', isAdd: true);
                        },
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          size: 30,
                          color: Colors.grey[800],
                        ),
                      )
                    : const Icon(Icons.image),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        const Text('Select Location',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        Container(
          height: 200,
          color: Colors.yellow[400],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
