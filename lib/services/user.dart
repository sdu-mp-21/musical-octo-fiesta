import 'dart:io';

import 'package:BookStore/models/user.dart';
import 'package:BookStore/services/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String API_URL = "https://musical-octo-fiesta.herokuapp.com/api/users";

Future<void> createUser(
    String firstName, String lastName, String email, String password) async {
  Uri uri = Uri.parse(API_URL);

  Map data = {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password
  };
  var body = json.encode(data);
  final headers = {HttpHeaders.contentTypeHeader: 'application/json'};

  http.Response response = await http.post(uri, body: body, headers: headers);

  if (response.statusCode == 200) {
    print("User created");
  } else {
    print(response.statusCode);
    print(response.body);
    throw Exception('Failed to create album.');
  }
}

Future<User> getUser() async {
  Uri uri = Uri.parse("$API_URL/me");
  String token = await getToken();

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    "x-auth-token": token
  };

  http.Response response = await http.get(uri, headers: headers);
  if (response.statusCode == 200) {
    var body = json.decode(response.body);
    User user = User.fromJson(body);
    return user;
  } else {
    print(response.statusCode);
    print(response.body);
    throw Exception('Failed to get data about user');
  }
}
