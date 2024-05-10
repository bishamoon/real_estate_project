import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:real_estate/network/end_points.dart';


class HttpHelper {

//! GET DATA

  static Future getData({required String url}) async {
    try {
      http.Response response = await http
          .get(Uri.parse(EndPoints.baseUrl + url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'bearer ${EndPoints.token}'
      });
      // .timeout(const Duration(seconds: 20),
      //         onTimeout: () => throw 'Check Your Internet connection');

      return jsonResponse(response);
    } on SocketException {
      throw 'check your internet in your device';
    } catch (e) {
      print(e.toString());
    }
  }

//! POST DATA

  static Future postData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      http.Response response = await http.post(
          Uri.parse(EndPoints.baseUrl + url),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'bearer ${EndPoints.token}'
          });

      return jsonResponse(response);
    } on SocketException {
      throw 'check your internet in your device';
    } catch (e) {
      print(e.toString());
    }
  }
//! UPDATE DATA

  static Future updateData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      http.Response response = await http.put(
          Uri.parse(EndPoints.baseUrl + url),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'bearer ${EndPoints.token}'
          });
      // .timeout(const Duration(seconds: 10),
      //         onTimeout: () => throw 'Check Your Internet connection');

      return jsonResponse(response);
    } on SocketException {
      throw 'check your internet in your device';
    } catch (e) {
      print(e.toString());
    }
  }

  static jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 404:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 401:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 500:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
    }
  }
}