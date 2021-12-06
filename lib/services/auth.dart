import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String API_URL = "https://musical-octo-fiesta.herokuapp.com/api/auth";

Future<String> login(String email, String password) async {
  Uri uri = Uri.parse(API_URL);
  Map data = {"email": email, "password": password};
  final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  var body = json.encode(data);
  var response = await http.post(uri, body: body, headers: headers);

  if (response.statusCode != 200) {
    print(response.statusCode);
    print(response.body);
    throw Exception('Failed to create new user');
  }

  return response.body;
}

Future<void> setToken(String token) async {
  final pref = await SharedPreferences.getInstance();
  await pref.setString("token", token);
}

Future<String> getToken() async {
  final pref = await SharedPreferences.getInstance();
  final token = pref.getString("token");
  if(token == null) {
    return "";
  }
  return token;
}
