import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

const String API_URL = "https://musical-octo-fiesta.herokuapp.com/api/auth";

Future<String> login(String email, String password) async {
  Uri uri = Uri.parse(API_URL);
  Map data = {"email": email, "password": password};
  final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  var body = json.encode(data);
  var response = await http.post(uri, body: body, headers: headers);

  if (response.statusCode == 200) {
    print("User created");
  } else {
    print(response.statusCode);
    print(response.body);
    throw Exception('Failed to create album.');
  }

  return response.body;
}
