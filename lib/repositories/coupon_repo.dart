import 'package:east_stay_vendor/services/api_services.dart';
import 'package:east_stay_vendor/services/shared_pref.dart';
import 'package:east_stay_vendor/services/url.dart';

class CouponRepo {
  final token = SharedPref.instence.getVendor();

  EitherResponse getAllCoupons() async =>
      await ApiService.getApi(AppUrl.getAllCoupons, token);

  EitherResponse createCoupons(Map couponInfo) async =>
      await ApiService.postApi(couponInfo, AppUrl.addCoupon, token);

  EitherResponse deleteCoupon(String couponId) async =>
      await ApiService.deleteApi(AppUrl.deleteCoupon + couponId, token!);
}
