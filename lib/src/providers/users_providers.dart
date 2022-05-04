import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rapidfast_delivery/src/api/environment.dart';
import 'package:rapidfast_delivery/src/models/repose_api.dart';
import 'package:rapidfast_delivery/src/models/user.dart';
import 'package:http/http.dart' as http;

class UsersProviders {
  BuildContext context;
  String _url = Environment.API_DELIVERY;
  String _api = '/api/users';

  // ignore: missing_return
  Future init(BuildContext context) {
    this.context = context;
  }

  Future<ResponseApi> create(User user) async {
    try {
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(user);
      Map<String, String> headers = {'Content-type': 'application/json'};
      final respose = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(respose.body);
      ResponseApi resposeApi = ResponseApi.fromJson(data);
      return resposeApi;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<ResponseApi> login(String email, password) async {
    try {
      Uri url = Uri.http(_url, '$_api/login');
      String bodyParams = json.encode({'email': email, 'password': password});
      Map<String, String> headers = {'Content-type': 'application/json'};
      final respose = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(respose.body);
      ResponseApi resposeApi = ResponseApi.fromJson(data);
      return resposeApi;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
