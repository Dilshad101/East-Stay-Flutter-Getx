import 'package:east_stay_vendor/model/booking_model.dart';
import 'package:east_stay_vendor/model/coupon_model.dart';
import 'package:east_stay_vendor/model/room_model.dart';
import 'package:east_stay_vendor/model/vendor_model.dart';
import 'package:east_stay_vendor/repositories/coupon_repo.dart';
import 'package:east_stay_vendor/repositories/profile_repo.dart';
import 'package:east_stay_vendor/repositories/room_repo.dart';
import 'package:east_stay_vendor/widgets/snackbar_messenger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorController extends GetxController {
  late Rx<VendorModel> vendor;
  List<Rx<RoomView>> vendorRooms = [];
  List<BookedRoomModel> bookedRooms = [];
  Map<String, String> dashBoard = {};
  List<Coupon> couponList = [];
  final amenities = {
    'TV': Icons.tv,
    'Wifi': Icons.wifi,
    'AC': Icons.ac_unit_rounded,
    'Kitchen': Icons.soup_kitchen_outlined,
  };

  setVendor(VendorModel vendor) {
    this.vendor = vendor.obs;
  }

  addToCouponList(Coupon coupon) {
    couponList.add(coupon);
    update();
  }

  getVendorRooms() async {
    final either = await RoomRepo().getAllRooms();
    either.fold((left) {
      vendorRooms = [];
    }, (response) {
      final roomData = response['roomView'] as List;
      vendorRooms = roomData.map((e) => RoomView.fromJson(e).obs).toList();
      update();
    });
  }

  Future<Map?> getVendorData(String token) async {
    final either = await ProfileRepo().getVendorData();
    either.fold((error) {
      Get.showSnackbar(getxSnackbar(message: error.message, isError: true));
      return null;
    }, (response) {
      if (response['auth'] == false) return null;
      final vendor = VendorModel.fromJson(response['vendorDetails'])
        ..token = token;
      this.vendor = vendor.obs;
    });
    if (either.right['auth'] == true) {
      await getVendorRooms();
      await getAllCoupons();
      await getAllBookings();
      await getDashBoardData();
    }
    return either.right;
  }

  // addRoom(RoomView room) {
  //   vendorRooms.add(room.obs);
  //   update();
  // }

  getDashBoardData() async {
    final either = await ProfileRepo().getDashBoardData();
    either.fold((error) {
      Get.showSnackbar(getxSnackbar(message: error.message, isError: true));
    }, (response) {
      dashBoard['revenue'] = response['bookingAmount'].toString();
      dashBoard['customer'] = response['customer'].toString();
      dashBoard['totalRooms'] = vendorRooms.length.toString();
      update();
    });
  }

  deleteCoupon(String couponId) async {
    couponList.removeWhere((element) => element.id == couponId);
    update();
    Get.showSnackbar(
        getxSnackbar(message: 'Coupon Deleted Successfully', isError: false));
  }

  getAllCoupons() async {
    final either = await CouponRepo().getAllCoupons();
    either.fold((error) {
      Get.showSnackbar(getxSnackbar(message: error.message, isError: true));
    }, (response) {
      final rawList = response as List;
      couponList = rawList.map((e) => Coupon.fromJson(e)).toList();
      update();
    });
  }

  getAllBookings() async {
    final either = await RoomRepo().getAllBookings();
    either.fold((error) {
      Get.showSnackbar(getxSnackbar(message: error.message, isError: true));
    }, (response) {
      final rawList = response['viewBookings'] as List;
      bookedRooms = rawList.map((e) => BookedRoomModel.fromJson(e)).toList();
      update();
    });
  }
}
