import 'package:east_stay_vendor/model/room_model.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class Searchcontroller extends GetxController {
  final roomList = Get.find<VendorController>().vendorRooms;
  List<Rx<RoomView>> filteredList = [];
  final Debouncer _debouncer = Debouncer(delay: Duration(seconds: 3));
  searchRoom(String value) {
    _debouncer(
      () {
        filteredList = roomList
            .where((element) =>
                element.value.state.toLowerCase().contains(
                      value.toLowerCase(),
                    ) ||
                element.value.propertyType.toLowerCase().contains(
                      value.toLowerCase(),
                    ))
            .toList();
      },
    );
    print(filteredList);
  }
}
