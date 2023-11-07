import 'package:intl/intl.dart';

class Coupon {
  final String id;
  final String vendorId;
  final String couponcode;
  final int discountAmount;
  final String fromDate;
  final String toDate;
  final bool isExpire;

  Coupon({
    required this.id,
    required this.isExpire,
    required this.vendorId,
    required this.couponcode,
    required this.discountAmount,
    required this.fromDate,
    required this.toDate,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    final  firstDate=DateTime.parse(json["startDate"]);
    final  secondDate=DateTime.parse(json["endDate"]);
    final formatedFirstDate=DateFormat('MMM-dd-yyyy').format(firstDate);
    final formatedSecondDate=DateFormat('MMM-dd-yyyy').format(secondDate);
    return Coupon(
      id: json["_id"],
      isExpire: json['isExpire'] as bool,
      vendorId: json['vendorId'] as String,
      couponcode: json['couponCode'] as String,
      discountAmount: json['discount'] as int,
      fromDate:formatedFirstDate,
      toDate: formatedSecondDate,
    );
  }

  Map<String, dynamic> toJson(Coupon coupon) {
    return {
      '_id': coupon.id,
      'vendorId': coupon.vendorId,
      'couponCode': coupon.couponcode,
      'discount': coupon.discountAmount,
      'startDate': coupon.fromDate,
      'endDate': coupon.toDate,
      'isExpire': coupon.isExpire,
    };
  }
}
