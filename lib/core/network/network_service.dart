import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkService {
  static const BASE_URL = "https://rickandmortyapi.com/api/";

  static Future<dynamic> get({
    required String path,
  }) async {
    try {
      final response = await http.get(
        Uri.parse((BASE_URL + path)),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return getResponse(response);
    } on SocketException {
      return Future.error(
          {"message": "Unable to establish connection to the server"});
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<dynamic> post({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(BASE_URL + path),
        body: json.encode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return getResponse(response);
    } on SocketException {
      return Future.error(
          {"message": "Unable to establish connection to the server"});
    } catch (e) {
      return Future.error({"message": e.toString()});
    }
  }

  static Future<dynamic> put({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await http.put(
        Uri.parse(BASE_URL + path),
        body: json.encode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return getResponse(response);
    } on SocketException {
      return Future.error(
          {"message": "Unable to establish connection to the server"});
    } catch (e) {
      return Future.error({"message": e.toString()});
    }
  }

  static dynamic getResponse(http.Response response) {
    if (response.body.isEmpty &&
        response.statusCode >= 200 &&
        response.statusCode < 300) {
      return {"message": "", "code": response.statusCode};
    }

    if (response.body.isEmpty && response.statusCode >= 400) {
      return Future.error(
          {"message": "An error has occurred", "code": response.statusCode});
    }
    final decodedJson = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decodedJson;
    }

    if (response.statusCode >= 400) {
      return Future.error(decodedJson);
    }

  }
}
