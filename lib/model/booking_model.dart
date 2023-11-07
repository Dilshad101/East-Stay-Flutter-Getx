import 'package:east_stay_vendor/model/room_model.dart';
import 'package:east_stay_vendor/model/user_model.dart';
import 'package:east_stay_vendor/model/vendor_model.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookedRoomModel {
  final String id;
  final RoomView room;
  final UserModel user;
  final String vendorId;
  final int adult;
  final int totalRoom;
  final String location;
  final String checkIn;
  final String checkOut;
  final double roomPrice;
  final String type;
  final double totalAmount;
  final String address;
  final num phone;
  final String place;
  final int days;
  final bool isCancel;

  BookedRoomModel({
    required this.id,
    required this.room,
    required this.user,
    required this.vendorId,
    required this.adult,
    required this.totalRoom,
    required this.location,
    required this.checkIn,
    required this.checkOut,
    required this.roomPrice,
    required this.type,
    required this.totalAmount,
    required this.address,
    required this.phone,
    required this.place,
    required this.days,
    required this.isCancel,
  });
  factory BookedRoomModel.fromJson(Map<String, dynamic> json) {
    json['roomId']['vendorId'] =
        VendorModel.tojson(Get.find<VendorController>().vendor.value);
    final checkinDate = DateTime.parse(json['checkIn']);
    final checkoutDate = DateTime.parse(json['checkOut']);
    final formatedCheckIn = DateFormat('MMM-dd-yyyy').format(checkinDate);
    final formatedCheckOut = DateFormat('MMM-dd-yyyy').format(checkoutDate);
    return BookedRoomModel(
      id: json['_id'],
      room: RoomView.fromJson(json['roomId']),
      user: UserModel.fromJson(json['userId']),
      vendorId: json['vendorId'],
      adult: json['adult'],
      totalRoom: json['rooms'],
      location: json['location'],
      checkIn: formatedCheckIn,
      checkOut: formatedCheckOut,
      roomPrice: json['RoomPrice'].toDouble(),
      type: json['type'],
      totalAmount: json['total'].toDouble(),
      address: json['address'],
      phone: json['phone'],
      place: json['place'],
      days: json['days'],
      isCancel: json['isCancel'],
    );
  }
}
