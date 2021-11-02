import "package:BookStore/models/book.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

const String API_URL = "https://musical-octo-fiesta.herokuapp.com/api/books";

Future<List<Book>> getAllBooks() async {
  Uri uri = Uri.parse(API_URL);
  var response = await http.get(uri);
  var books = json.decode(response.body);

  List<Book> list = [];

  for (var book in books) {
    list.add(new Book.fromJson(book));
  }

  return list;
}

Future<Book> getBookById(String id) async {
  Uri uri = Uri.parse("$API_URL/$id");
  var response = await http.get(uri);
  var body = json.decode(response.body);

  Book book = Book.fromJson(body);
  return book;
}

Future<List<Book>> getBooksByTitle(String title) async {
  Uri uri = Uri.parse("$API_URL?title=$title");
  var response = await http.get(uri);
  var books = json.decode(response.body);

  List<Book> list = [];

  for (var book in books) {
    list.add(new Book.fromJson(book));
  }

  return list;
}
