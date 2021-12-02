import "package:BookStore/models/book.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

const String API_URL = "https://musical-octo-fiesta.herokuapp.com/api/books";

Future<List<Book>> getAllBooks() async {
  try {
    Uri uri = Uri.parse(API_URL);
    var response = await http.get(uri);
    var books = json.decode(response.body);

    List<Book> list = [];

    for (var book in books) {
      list.add(new Book.fromJson(book));
    }

    return list;
  } catch (err) {
    return Future.error("Error occured");
  }
}

Future<Book> getBookById(String id) async {
  try {
    Uri uri = Uri.parse("$API_URL/$id");
    var response = await http.get(uri);
    var body = json.decode(response.body);

    Book book = Book.fromJson(body);
    return book;
  } catch (err) {
    return Future.error("Error occured");
  }
}

Future<List<Book>> getBooksByTitle(String title) async {
  try {
    Uri uri = Uri.parse("$API_URL?title=$title");
    var response = await http.get(uri);
    var books = json.decode(response.body);

    List<Book> list = [];

    for (var book in books) {
      list.add(new Book.fromJson(book));
    }

    return list;
  } catch (err) {
    return Future.error("Error occured");
  }
}

Future<List<Book>> getBooksByGenre(String genreId) async {
  try {
    Uri uri = Uri.parse("$API_URL?genre=$genreId");
    var response = await http.get(uri);
    var books = json.decode(response.body);

    List<Book> list = [];

    for (var book in books) {
      list.add(new Book.fromJson(book));
    }

    return list;
  } catch (err) {
    return Future.error("Error occured");
  }
}

//class ShopDataProvider {
Future<BooksData> getShopItems() async {
  try {
    Uri uri = Uri.parse(API_URL);
    var response = await http.get(uri);
    var books = json.decode(response.body);
    print('BOOKS: ${books}');

    List<Book> booksData = [];

    for (var book in books) {
      booksData.add(new Book.fromJson(book));
    }

    return BooksData(booksData);
  } catch (err) {
    return Future.error("Error occured");
  }
}

Future<BooksData> getCartItems() async {
  try {
    Uri uri = Uri.parse(API_URL);
    var response = await http.get(uri);
    var books = json.decode(response.body);

    List<Book> booksData = [];

    for (var book in books) {
      booksData.add(new Book.fromJson(book));
    }

    return BooksData(booksData);
  } catch (err) {
    return Future.error("Error occured");
  }
}
//}
