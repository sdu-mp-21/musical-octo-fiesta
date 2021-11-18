import 'package:BookStore/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String API_URL = "https://musical-octo-fiesta.herokuapp.com/api/users";

Future<void> createUser(
    String firstName, String lastName, String email, String password) async {
  Uri uri = Uri.parse(API_URL);
  var body = json.encode({
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password
  });

  http.Response response = await http.post(uri, body: body);

  // User user = User.fromJson(body);

  // return user;
  int statusCode = response.statusCode;
  print('This is the statuscode: $statusCode');
  final responseJson = json.decode(response.body);
  print(responseJson);
}

Future<User> getUser() async {
  Uri uri = Uri.parse("$API_URL/me");
  var response = await http.get(uri);
  var body = json.decode(response.body);

  User user = User.fromJson(body);

  return user;
}
