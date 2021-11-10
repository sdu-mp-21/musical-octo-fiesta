import 'package:BookStore/models/author.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String API_URL = "https://musical-octo-fiesta.herokuapp.com/api/authors";

Future<List<Author>> getAllAuthors() async {
  Uri uri = Uri.parse(API_URL);
  var response = await http.get(uri);
  var books = json.decode(response.body);

  List<Author> list = [];

  for (var book in books) {
    list.add(new Author.fromJson(book));
  }

  return list;
}

Future<Author> getAuthorById(String id) async {
  Uri uri = Uri.parse("$API_URL/$id");
  var response = await http.get(uri);
  var body = json.decode(response.body);

  Author book = Author.fromJson(body);
  return book;
}
