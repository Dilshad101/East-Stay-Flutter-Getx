import 'package:east_stay_vendor/services/api_services.dart';
import 'package:east_stay_vendor/services/shared_pref.dart';
import 'package:east_stay_vendor/services/url.dart';

class RoomRepo {
  final token = SharedPref.instence.getVendor()!;

  EitherResponse getAllRooms() async =>
      await ApiService.getApi(AppUrl.getAllRooms, token);

  EitherResponse addRoom(var rawData) async =>
      await ApiService.postApi(rawData, AppUrl.addRoom, token);

  EitherResponse deleteRoom(String roomId) async =>
      await ApiService.deleteApi(AppUrl.deleteRoom + roomId, token);

  EitherResponse updateRoom(var rawData, String roomId) async =>
      await ApiService.putApi(rawData, AppUrl.updateRoom + roomId, token);

  EitherResponse getAllBookings() async =>
      await ApiService.getApi(AppUrl.getAllBookings, token);
}
