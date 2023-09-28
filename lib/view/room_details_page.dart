import 'package:card_swiper/card_swiper.dart';
import 'package:east_stay_vendor/widgets/button_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widgets/amenities.dart';
import '../widgets/room_info_text.dart';

class ScreenRoomDetails extends StatelessWidget {
  const ScreenRoomDetails({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 0),
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .4,
                color: Colors.green,
                child: Swiper(
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                    color: index % 2 == 0 ? Colors.blue : Colors.yellow,
                  ),
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        activeColor: Color(0xffE55959),
                        color: Color(0xFFE0E0E0),
                        activeSize: 11,
                        space: 4),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: MediaQuery.sizeOf(context).height * .05,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                top: MediaQuery.sizeOf(context).height * .05,
                child: Material(
                  borderRadius: BorderRadius.circular(50),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: MoreButton(
                      text1: 'Edit',
                      text2: 'Delete',
                      icon1: Icons.edit,
                      icon2: Icons.delete,
                      onSelected: (value) {
                        if (value == 1) {
                          print('Edit function');
                        }
                        if (value == 2) {
                          print('delete function');
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Hotel Paragon',
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff232323),
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.''',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff484848),
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 15),
          const Divider(thickness: 1, color: Color(0xFFE0E0E0)),
          // const Divider(height: 1, thickness: 6, color: Color(0xffD9D9D9)),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Amenities',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Amenities(),
          const SizedBox(height: 15),
          const Divider(thickness: 1, color: Color(0xFFE0E0E0)),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Room info',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                RoomInfoText(
                  text1: 'Location',
                  text2: 'Calicut Kerela',
                ),
                SizedBox(height: 5),
                RoomInfoText(
                  text1: 'Property Type',
                  text2: ' Resort',
                ),
                SizedBox(height: 5),
                RoomInfoText(
                  text1: 'Room Type',
                  text2: 'Classic',
                ),
                SizedBox(height: 5),
                RoomInfoText(
                  text1: 'Capacity',
                  text2: '4',
                ),
                SizedBox(height: 5),
                RoomInfoText(
                  text1: 'Total Rooms',
                  text2: '1',
                ),
                SizedBox(height: 5),
                RoomInfoText(
                  text1: 'Room Rate',
                  text2: '1400',
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
