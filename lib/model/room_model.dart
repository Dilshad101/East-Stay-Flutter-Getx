import 'package:east_stay_vendor/model/vendor_model.dart';

class RoomView {
  String id;
  VendorModel vendor;
  String? address;
  String city;
  String state;
  String zip;
  List img;
  String propertyType;
  String description;
  String price;
  String capacity;
  String totalRooms;
  String adultsRate;
  String location;
  String longitude;
  num latitude;
  String category;
  List<String> amenities;
  bool isApproved;

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
      city: json['city'] ?? 'city',
      state: json['state'] ?? 'state',
      zip: json['zip'] ?? 'zip',
      img: json['img'] as List,
      propertyType: json['propertyType'] ?? 'propertyType',
      description: json['description'] ?? 'description',
      price: json['price'] ?? 'price',
      capacity: json['capacity'] ?? 'capacity',
      totalRooms: json['totalrooms'] ?? 'totalRooms',
      adultsRate: json['AdultsRate'] ?? 'adult',
      location: json['location'] ?? 'location',
      longitude: json['longitude'] ?? 'latitude',
      latitude: json['latitude'] ?? 9009.0,
      category: json['category'] ?? 'cat',
      amenities: List<String>.from(json['amenities'] ?? []),
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
