import 'package:east_stay_vendor/services/api_services.dart';
import 'package:east_stay_vendor/services/shared_pref.dart';
import 'package:east_stay_vendor/services/url.dart';

class AuthRepo {
  final token = SharedPref.instence.getVendor();

  EitherResponse loginVendor(var rawData) async =>
      await ApiService.postApi(rawData, AppUrl.login);

  EitherResponse signupVendor(var rawData) async =>
      await ApiService.postApi(rawData, AppUrl.signup);
}
