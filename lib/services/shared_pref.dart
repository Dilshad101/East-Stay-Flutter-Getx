import 'package:east_stay_vendor/model/vendor_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();
  static final SharedPref _instence = SharedPref._();
  static SharedPref get instence => _instence;

  static const String email = 'email';
  static const String token = 'token';
  static const String password = 'password';

  late SharedPreferences sharedPref;

  initStorage() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  setVendor(VendorModel vendor) async {
    await sharedPref.setString(email, vendor.email);
    await sharedPref.setString(token, vendor.token!);
    await sharedPref.setString(password, vendor.password);
  }

  Future<String?> getVendor() async {
    // final vendorMail = sharedPref.getString(email);
    final vendorToken = sharedPref.getString(token);
    // final vendorPassword = sharedPref.getString(password);
    return vendorToken;
  }
}
