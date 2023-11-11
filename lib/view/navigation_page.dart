import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view/booked_room_page.dart';
import 'package:east_stay_vendor/view/home_page.dart';
import 'package:east_stay_vendor/view/room_list_page.dart';
import 'package:east_stay_vendor/view/search_page.dart';
import 'package:east_stay_vendor/view_model/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:icons_plus/icons_plus.dart';

class ScreenParent extends StatelessWidget {
  ScreenParent({super.key});

  final List<Widget> _screens = [
    ScreenHome(),
    const ScreenSearch(),
    const ScreenRooms(),
    const ScreenBookingDetails(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
      init: NavController(),
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.currentPage],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentPage,
            onTap: (value) => controller.changePage(value),
            selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: Colors.grey[400],
            showSelectedLabels: F,
            showUnselectedLabels: F,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(BoxIcons.bx_home_alt_2), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(EvaIcons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(BoxIcons.bx_hotel), label: 'Room'),
              BottomNavigationBarItem(
                  icon: Icon(BoxIcons.bx_notepad), label: 'Bookins')
            ],
          ),
        );
      },
    );
  }
}
