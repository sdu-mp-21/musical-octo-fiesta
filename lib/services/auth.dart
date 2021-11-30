import 'dart:convert';

import 'package:http/http.dart' as http;

const String API_URL = "https://musical-octo-fiesta.herokuapp.com/api/auth";

Future<String> login(String email, String password) async {
  Uri uri = Uri.parse(API_URL);
  var response = await http.post(uri, body: {email, password});
  var token = json.decode(response.body);

  return token;
}
