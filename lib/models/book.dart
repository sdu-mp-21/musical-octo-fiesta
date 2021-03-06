class BooksData {
  List<Book> booksData;
  BooksData(this.booksData);

  void addProduct(Book b) {
    booksData.add(b);
  }

  void removeProduct(Book b) {
    booksData.add(b);
  }
}

class Book {
  final String id;
  final String title;
  final int price;
  final String image;
  final String genre;
  final String author;
  final String description;
  final int rating;
  final int pageCount;
  final String publisher;
  final String language;
  int quantity;

  Book(
      {this.id,
      this.rating,
      this.pageCount,
      this.publisher,
      this.language,
      this.title,
      this.author,
      this.price,
      this.image,
      this.description,
      this.genre,
      this.quantity});

  Book.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        rating = json["rating"].toInt(),
        pageCount = json["pageCount"],
        publisher = json["publisher"],
        language = json["language"],
        title = json["title"],
        author = json["author"],
        price = json["price"],
        image = json["image"],
        description = json["description"],
        genre = json["genre"];
}
