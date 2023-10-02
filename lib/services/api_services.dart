import 'dart:convert';
import 'package:east_stay_vendor/services/url.dart';
import 'package:http/http.dart' as http;

class Api {
  Api._();
  static final _instance = Api._();
  static Api get instance => _instance;

  final _header = {'Content-type': 'application/json; charset=UTF-8'};

  Future<Map<String, dynamic>> signupVendor(Map<String, String> vendor) async {
    final url = Uri.parse('${Url.baseUrl}${Url.signup}');
    final body = jsonEncode(vendor);
    final response = await http.post(url, body: body, headers: _header);
    return jsonDecode(response.body);
  }

  Future<http.Response> loginVendor(Map<String, dynamic> vendor) async {
    final body = jsonEncode(vendor);
    final url = Uri.parse('${Url.baseUrl}${Url.login}');
    return await http.post(url, body: body, headers: _header);
  }

  Future<http.Response> getVendorData(String token) async {
    final vendorToken = {'vendortoken': token};
    final url = Uri.parse('${Url.baseUrl}${Url.getVendor}');
    return await http.get(url, headers: vendorToken);
  }

  Future<Map<String, dynamic>> getAllRooms(String token) async {
    final vendorToken = {'vendortoken': token};
    final url = Uri.parse('${Url.baseUrl}${Url.getAllRooms}');
    final response = await http.get(url, headers: vendorToken);

    return jsonDecode(response.body);
  }

  Future<Map> addRoom(Map room, String token) async {
    final vendorToken = {
      'vendortoken': token,
      'Content-Type': 'application/json'
    };
    final url = Uri.parse('${Url.baseUrl}${Url.addRooms}');
    final body = jsonEncode(room);
    final response = await http.post(url, body: body, headers: vendorToken);
    return jsonDecode(response.body);
  }

  Future<http.Response> editVendor(Map vendorData, String token) async {
    final vendorToken = {
      'vendortoken': token,
      'Content-Type': 'application/json'
    };
    final url = Uri.parse('${Url.baseUrl}${Url.editVendor}');
    final body = jsonEncode(vendorData);
    return await http.patch(url, body: body, headers: vendorToken);
  }

  Future<http.Response> deleteRoom(String token, String roomId) async {
    final url = Url.baseUrl + Url.deleteRoom.replaceFirst('roomId', roomId);
    final vendorToken = {
      'vendortoken': token,
      'Content-Type': 'application/json'
    };
    return await http.delete(Uri.parse(url), headers: vendorToken);
  }

  Future<http.Response> updateRoom(
      String token, Map room, String roomid) async {
    final url = Url.baseUrl + Url.updateRoom.replaceFirst('roomId', roomid);
    final vendorToken = {
      'vendortoken': token,
      'Content-Type': 'application/json'
    };
    final body = jsonEncode(room);
    return http.put(Uri.parse(url), body: body, headers: vendorToken);
  }
}
