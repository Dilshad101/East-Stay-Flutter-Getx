import 'package:east_stay_vendor/widgets/divider_text.dart';
import 'package:east_stay_vendor/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_key_value_text.dart';

class ScreenBookedRoomDetails extends StatelessWidget {
  const ScreenBookedRoomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 0),
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .40,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 20, left: 20),
            color: Colors.grey,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 23,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  title: 'Customer Details',
                ),
                SizedBox(height: 15),
                Dividertext(
                  title: 'Name',
                  subtilte: 'Rahul',
                ),
                Dividertext(
                  title: 'Address',
                  subtilte: 'arangadu house kavanur,meprappad',
                ),
                Dividertext(
                  title: 'Mobile Number',
                  subtilte: '8090706856',
                ),
                SizedBox(height: 10),
                TitleText(title: 'Booking Details'),
                SizedBox(height: 10),
                KeyValueText(
                  text1: 'Booking ID',
                  text2: '90897c67',
                  size1: 14,
                  size2: 12,
                  color1: Color(0xff484848),
                  color2: Color(0xff484848),
                ),
                KeyValueText(
                  text1: 'Check in',
                  text2: '10-10-20203',
                  size1: 14,
                  size2: 12,
                  color1: Color(0xff484848),
                  color2: Color(0xff484848),
                ),
                KeyValueText(
                  text1: 'Check out',
                  text2: '12-10-2023',
                  size1: 14,
                  size2: 12,
                  color1: Color(0xff484848),
                  color2: Color(0xff484848),
                ),
                KeyValueText(
                  text1: 'Total Guest',
                  text2: '1',
                  size1: 14,
                  size2: 12,
                  color1: Color(0xff484848),
                  color2: Color(0xff484848),
                ),
                KeyValueText(
                  text1: 'Total Room',
                  text2: '1',
                  size1: 14,
                  size2: 12,
                  color1: Color(0xff484848),
                  color2: Color(0xff484848),
                ),
                KeyValueText(
                  text1: 'Room Rent',
                  text2: '1',
                  size1: 14,
                  size2: 12,
                  color1: Color(0xff484848),
                  color2: Color(0xff484848),
                ),
                KeyValueText(
                  text1: 'Duration',
                  text2: '2 Days',
                  size1: 14,
                  size2: 12,
                  color1: Color(0xff484848),
                  color2: Color(0xff484848),
                ),
                KeyValueText(
                  text1: 'Total Amount',
                  text2: '3000',
                  size1: 14,
                  size2: 12,
                  color1: Color(0xff484848),
                  color2: Color(0xff484848),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
