import 'package:east_stay_vendor/view_model/coupon_controller.dart';
import 'package:east_stay_vendor/view_model/map_controller.dart';
import 'package:east_stay_vendor/view_model/room_controller.dart';
import 'package:east_stay_vendor/view_model/search_controller.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:get/get.dart';

class InitController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomController());
    Get.lazyPut(() => CouponController());
    Get.lazyPut(() => FilterController());
    Get.lazyPut(() => MapBoxController());
    Get.put<VendorController>(VendorController(), permanent: true);
  }
}
