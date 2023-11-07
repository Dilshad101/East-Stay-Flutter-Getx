class VendorModel {
  String id;
  String name;
  String email;
  String password;
  String phone;
  String propertyName;
  String propertyLocation;
  bool isbanned;
  String? image;
  String? token;

  VendorModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.propertyName,
      required this.propertyLocation,
      required this.isbanned,
      this.image,
      this.token});

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
        propertyName: json['propertyName'],
        propertyLocation: json['propertyLocation'],
        image: json['image'],
        token: json["token"],
        isbanned: json['isBanned'] ?? false,
      );

  static Map<String, dynamic> tojson(VendorModel vendor) => {
        '_id': vendor.id,
        'name': vendor.name,
        'email': vendor.email,
        'password': vendor.password,
        'phone': vendor.phone,
        'propertyName': vendor.propertyName,
        'propertyLocation': vendor.propertyLocation,
        'image': vendor.image,
        'token': vendor.token,
        'isBanned': vendor.isbanned,
      };
}
