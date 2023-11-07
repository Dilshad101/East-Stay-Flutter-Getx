class AppUrl {
  static const String _baseUrl = 'https://api.electronicsmart.shop';

  static const String signup = '$_baseUrl/api/vendor/vendorSignup';
  static const String login = '$_baseUrl/api/vendor/vendorLogin';
  static const String getVendor = '$_baseUrl/api/vendor/vendorData';
  static const String editVendor = '$_baseUrl/api/vendor/editVendorProfile';
  static const String getAllRooms = '$_baseUrl/api/vendor/getRoomview';
  static const String addRoom = '$_baseUrl/api/vendor/addRoom';
  static const String deleteRoom = '$_baseUrl/api/vendor/delteRoom/';
  static const String addCoupon = '$_baseUrl/api/vendor/createCoupon';
  static const String getAllCoupons = '$_baseUrl/api/vendor/viewcoupon';
  static const String getAllBookings = '$_baseUrl/api/vendor/viewbooking';
  static const String updateRoom = '$_baseUrl/api/vendor/editRoomDetails/';
  static const String deleteCoupon = '$_baseUrl/api/vendor/deletecoupn/';
  static const String getDashBoardData = '$_baseUrl/api/vendor/vendorDash';
}