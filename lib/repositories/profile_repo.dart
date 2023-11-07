import 'package:east_stay_vendor/services/api_services.dart';
import 'package:east_stay_vendor/services/shared_pref.dart';
import 'package:east_stay_vendor/services/url.dart';

class ProfileRepo {
  final token = SharedPref.instence.getVendor()!;

  EitherResponse getVendorData() async =>
      await ApiService.getApi(AppUrl.getVendor, token);

  EitherResponse updateVendorInfo(var rawData) async =>
      await ApiService.patchApi(rawData, AppUrl.editVendor, token);

  EitherResponse getDashBoardData() async =>
      await ApiService.getApi(AppUrl.getDashBoardData, token);
}
