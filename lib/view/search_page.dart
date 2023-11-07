// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view_model/search_controller.dart';
import 'package:east_stay_vendor/widgets/recent_booking_tile.dart';
import 'package:east_stay_vendor/widgets/search_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch>
    with TickerProviderStateMixin {
  final filterController = Get.put(FilterController());
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        elevation: 0,
        bottom: searchBar(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            SizedBox(height: 20),
            TabBar(
              controller: tabController,
              labelColor: AppColor.secondaryColor,
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColor.primaryColor,
              tabs: [
                Tab(text: 'Your Rooms'),
                Tab(text: 'Your Bookings'),
              ],
              onTap: (value) => filterController.reset(),
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: [roomSearchView(), bookingSearchView()],
            ))
          ],
        ),
      ),
    );
  }

  GetBuilder<FilterController> bookingSearchView() {
    return GetBuilder<FilterController>(
      builder: (controller) => controller.filteredBookingList.isEmpty
          ? Center(
              child: Text(
              'No bookings available',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                wordSpacing: 2,
              ),
            ))
          : ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              shrinkWrap: true,
              itemBuilder: (context, index) => RecentBookingTile(
                  bookedRoom: controller.filteredBookingList[index]),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: controller.filteredBookingList.length,
            ),
    );
  }

  Widget roomSearchView() {
    return GetBuilder<FilterController>(builder: (controller) {
      return controller.filteredRoomList.isEmpty
          ? Center(
              child: Text(
              'No Rooms Available',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                wordSpacing: 2,
              ),
            ))
          : ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final room = controller.filteredRoomList[index].value;
                return SearchTile(room: room);
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: controller.filteredRoomList.length,
            );
    });
  }

  PreferredSize searchBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SearchBar(
          controller: filterController.searchController,
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.grey[300]!, width: .5),
            ),
          ),
          textStyle: MaterialStateProperty.all(TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: 'Poppins',
          )),
          hintText: 'Search your rooms and bookings...',
          hintStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 13, color: Colors.grey[500])),
          trailing: [
            Icon(
              Icons.search,
              color: Colors.grey[500],
            )
          ],
          onChanged: (value) => tabController.index == 1
              ? filterController.onBookingSearch(value)
              : filterController.onRoomSearch(value),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    filterController.reset();
    tabController.dispose();
  }
}
