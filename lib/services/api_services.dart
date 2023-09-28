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

  Future<Map<String, dynamic>> loginVendor(Map<String, dynamic> vendor) async {
    final body = jsonEncode(vendor);
    final url = Uri.parse('${Url.baseUrl}${Url.login}');
    final response = await http.post(url, body: body, headers: _header);
    final result = jsonDecode(response.body);

    return result;
  }

  Future<Map<String, dynamic>> getVendorData(String token) async {
    final vendorToken = {'vendortoken': token};
    final url = Uri.parse('${Url.baseUrl}${Url.getVendor}');
    final response = await http.get(url, headers: vendorToken);
    return jsonDecode(response.body);
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
}
