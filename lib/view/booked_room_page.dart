import 'package:east_stay_vendor/view/booked_room_details_page.dart';
import 'package:east_stay_vendor/widgets/custom_key_value_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenBookingDetails extends StatelessWidget {
  const ScreenBookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Details"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.black87,
              )),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Container(
              height: 185,
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: MediaQuery.sizeOf(context).width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey.shade300),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: Column(
                            children: [
                              KeyValueText(
                                text1: 'Customer',
                                text2: 'James',
                                size1: 13,
                                size2: 16,
                                color1: Colors.black,
                                color2: Color(0xffE55959),
                                fontWeight1: FontWeight.w600,
                                fontWeight2: FontWeight.w500,
                              ),
                              SizedBox(height: 4),
                              KeyValueText(
                                text1: 'Mobile num',
                                text2: '909090999',
                                size1: 13,
                                size2: 11.5,
                                color1: Color(0xff3C3B3B),
                                color2: Color(0xff7A7A7A),
                                fontWeight1: FontWeight.w600,
                                fontWeight2: FontWeight.w500,
                              ),
                              SizedBox(height: 4),
                              KeyValueText(
                                text1: 'Check in Date',
                                text2: '10-9-2023',
                                size1: 13,
                                size2: 11.5,
                                color1: Color(0xff3C3B3B),
                                color2: Color(0xff7A7A7A),
                                fontWeight1: FontWeight.w600,
                                fontWeight2: FontWeight.w500,
                              ),
                              SizedBox(height: 4),
                              KeyValueText(
                                text1: 'Check out Date',
                                text2: '12-9-2023',
                                size1: 13,
                                size2: 11.5,
                                color1: Color(0xff3C3B3B),
                                color2: Color(0xff7A7A7A),
                                fontWeight1: FontWeight.w600,
                                fontWeight2: FontWeight.w500,
                              ),
                              SizedBox(height: 4),
                              KeyValueText(
                                text1: 'Room rent',
                                text2: '₹ 1300',
                                fontFamily: 'Ubuntu',
                                size1: 13,
                                size2: 12,
                                color1: Color(0xff3C3B3B),
                                color2: Colors.black,
                                fontWeight1: FontWeight.w600,
                                fontWeight2: FontWeight.w500,
                              ),
                              // BookingDetailText(
                              //   text1: 'Room rent',
                              //   text2: '4000',
                              //   color: Colors.black,
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => Get.to(const ScreenBookedRoomDetails()),
                    child: Container(
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xffE55959),
                      ),
                      child: const Text(
                        'View Details',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
