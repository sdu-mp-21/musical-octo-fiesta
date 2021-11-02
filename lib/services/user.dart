import 'package:BookStore/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String API_URL = "https://musical-octo-fiesta.herokuapp.com/api/users";

Future<User> createUser(
    String firstName, String lastName, String email, String password) async {
  Uri uri = Uri.parse(API_URL);
  var response =
      await http.post(uri, body: {firstName, lastName, email, password});
  var body = json.decode(response.body);

  User user = User.fromJson(body);

  return user;
}

Future<User> getUser() async {
  Uri uri = Uri.parse("$API_URL/me");
  var response = await http.get(uri);
  var body = json.decode(response.body);

  User user = User.fromJson(body);

  return user;
}
