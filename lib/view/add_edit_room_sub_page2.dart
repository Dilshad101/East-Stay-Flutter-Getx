import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view/map_page.dart';
import 'package:east_stay_vendor/view_model/map_controller.dart';
import 'package:east_stay_vendor/view_model/room_controller.dart';
import 'package:east_stay_vendor/widgets/drop_down_button.dart';
import 'package:east_stay_vendor/widgets/image.dart';
import 'package:east_stay_vendor/widgets/selected_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRoomSubScreen2 extends StatelessWidget {
  AddRoomSubScreen2({
    super.key,
    required this.roomController,
    required this.icons,
    required this.items,
  });

  final RoomController roomController;
  final List<IconData> icons;
  final List<String> items;
  final boxController = Get.put(MapBoxController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('select room Amenities',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        amenities(),
        const SizedBox(height: 20),
        const Text(
          'Category',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        DropDownButton(selectedCategory: roomController.selectedCategory),
        const SizedBox(height: 20),
        roomController.room != null
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Old Room Pictures',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                ],
              )
            : const SizedBox.shrink(),
        roomController.room != null
            ? UploadedImages(roomController: roomController)
            : const SizedBox.shrink(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Upload Room Pictures (4)',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            IconButton(
                onPressed: () => roomController.addImage(),
                icon: const Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.blue,
                ))
          ],
        ),
        const SizedBox(height: 5),
        SelectedImages(),
        const SizedBox(height: 20),
        const Text('Select Location',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => Get.to(() => ScreenMapView()),
          child: SizedBox(
            height: 200,
            child: Stack(
              children: [
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/map.jpg'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black.withOpacity(.7),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Tap here',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget amenities() {
    return GetBuilder<RoomController>(
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
                  isAdd: !roomController.selectedAmenities
                      .contains(roomController.amenities[index]));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(6),
                color: roomController.selectedAmenities
                        .contains(roomController.amenities[index])
                    ? AppColor.secondaryColor
                    : Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    icons[index],
                    size: 25,
                    color: roomController.selectedAmenities
                            .contains(roomController.amenities[index])
                        ? Colors.white
                        : AppColor.secondaryColor,
                  ),
                  Text(
                    items[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .8,
                      color: roomController.selectedAmenities
                              .contains(roomController.amenities[index])
                          ? Colors.white
                          : AppColor.secondaryColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
