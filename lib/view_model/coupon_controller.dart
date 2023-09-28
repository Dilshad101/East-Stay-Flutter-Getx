import 'package:east_stay_vendor/model/coupon_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CouponController extends GetxController {
  List<Coupon> couponList = [];
  addToCouponList() {}
  String getFromatedDate(DateTime? date) {
    if (date != null) {
      final formatedString = DateFormat('dd-MM-yyyy').format(date);
      return formatedString;
    }
    return '';
  }
}
