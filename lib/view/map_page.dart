import 'package:east_stay_vendor/utils/map_box.dart';
import 'package:east_stay_vendor/view_model/map_controller.dart';
import 'package:east_stay_vendor/view_model/room_controller.dart';
import 'package:east_stay_vendor/widgets/snackbar_messenger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class ScreenMapView extends StatelessWidget {
  ScreenMapView({super.key});
  final mapboxController = Get.find<MapBoxController>();

  @override
  Widget build(BuildContext context) {
    final dpadding = MediaQuery.of(context).padding.top;
    return GetBuilder<MapBoxController>(builder: (boxcontroller) {
      return Scaffold(
        body: Stack(
          children: [
            mapView(boxcontroller),
            searchBar(dpadding, boxcontroller),
            searchResultView(dpadding, boxcontroller)
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (boxcontroller.selectedLatLng != null) {
              Get.find<RoomController>().selectedLatLng = boxcontroller.latlong;
              Get.back();
            } else {
              Get.showSnackbar(getxSnackbar(
                  message: 'select your hotel Location', isError: true));
            }
          },
          label: const Text('Done', style: TextStyle(fontSize: 12)),
          icon: const Icon(Icons.done),
        ),
      );
    });
  }

  Widget mapView(MapBoxController boxcontroller) {
    return FlutterMap(
      mapController: boxcontroller.mapController,
      options: MapOptions(
        initialCenter: boxcontroller.latlong,
        initialZoom: 14,
        onTap: (tapPosition, point) {
          boxcontroller.onTaped(point);
        },
      ),
      children: [
        TileLayer(
          urlTemplate: MapBoxHelper.urlTemplate,
          additionalOptions: const {
            "accessToken": MapBoxHelper.accessToken,
            "id": MapBoxHelper.mapId
          },
        ),
        MarkerLayer(alignment: Alignment.center, markers: [
          Marker(
            height: 100,
            width: 100,
            point: boxcontroller.latlong,
            child: const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 35,
            ),
          )
        ])
      ],
    );
  }

  Widget searchBar(double dpadding, MapBoxController boxcontroller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: dpadding + 10),
      child: SearchBar(
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
        trailing: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
        onSubmitted: (value) async {
          boxcontroller.onSubmitted(value);
        },
      ),
    );
  }

  Widget searchResultView(double dpadding, MapBoxController boxcontroller) {
    return Positioned(
      top: dpadding + 60,
      left: 20,
      right: 20,
      child: Visibility(
        visible: boxcontroller.searchResults.isNotEmpty,
        child: SizedBox(
          height: Get.height * .4,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: ListTile(
                      leading: const Icon(Icons.search),
                      horizontalTitleGap: 0,
                      title: Text(
                        boxcontroller.searchResults[index]['placeName']
                            .toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        final newlatlong = LatLng(
                          boxcontroller.searchResults[index]['latitude'],
                          boxcontroller.searchResults[index]['longitude'],
                        );
                        boxcontroller.onSelected(newlatlong);
                      },
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: boxcontroller.searchResults.length),
        ),
      ),
    );
  }
}
