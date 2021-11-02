import 'package:BookStore/models/genre.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String API_URL = "https://musical-octo-fiesta.herokuapp.com/api/genres";

Future<List<Genre>> getGenres() async {
  Uri uri = Uri.parse(API_URL);
  var response = await http.get(uri);
  var genres = json.decode(response.body);

  List<Genre> list = [];

  for (var genre in genres) {
    list.add(new Genre.fromJson(genre));
  }

  return list;
}

Future<Genre> getGenre(String id) async {
  Uri uri = Uri.parse("API_URL/$id");
  var response = await http.get(uri);
  var body = json.decode(response.body);

  Genre genre = new Genre.fromJson(body);

  return genre;
}
