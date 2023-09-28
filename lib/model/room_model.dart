import 'package:east_stay_vendor/model/vendor_model.dart';

class RoomView {
  final String id;
  final VendorModel vendor;
  final String address;
  final String city;
  final String state;
  final String zip;
  final List<String> img;
  final String propertyType;
  final String description;
  final String price;
  final String capacity;
  final String totalRooms;
  final String adultsRate;
  final String location;
  final String longitude;
  final double latitude;
  final String category;
  final List<String> amenities;
  final bool isApproved;

  RoomView({
    required this.id,
    required this.vendor,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.img,
    required this.propertyType,
    required this.description,
    required this.price,
    required this.capacity,
    required this.totalRooms,
    required this.adultsRate,
    required this.location,
    required this.longitude,
    required this.latitude,
    required this.category,
    required this.amenities,
    required this.isApproved,
  });

  factory RoomView.fromJson(Map<String, dynamic> json) {
    return RoomView(
      id: json['_id'],
      vendor: VendorModel.fromJson(json['vendorId']),
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      img: [],/*List<String>.from(json['img']),*/
      propertyType: json['propertyType'],
      description: json['description'],
      price: json['price'],
      capacity: json['capacity'],
      totalRooms: json['totalrooms'],
      adultsRate: json['AdultsRate'],
      location: json['location'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      category: json['category'],
      amenities: List<String>.from(json['amenities']),
      isApproved: json['isApproved'],
    );
  }

  Map<String, dynamic> toJson(VendorModel vendor) {
    return {
      '_id': id,
      'vendorId': VendorModel.tojson(vendor),
      'address': address,
      'city': city,
      'state': state,
      'zip': zip,
      'img': img,
      'propertyType': propertyType,
      'description': description,
      'price': price,
      'capacity': capacity,
      'totalrooms': totalRooms,
      'AdultsRate': adultsRate,
      'location': location,
      'longitude': longitude,
      'latitude': latitude,
      'category': category,
      'amenities': amenities,
      'isApproved': isApproved,
    };
  }
}
