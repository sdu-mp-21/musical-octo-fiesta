class Author {
  final String id;
  final String firstName;
  final String lastName;
  final String image;

  Author(this.id, this.firstName, this.lastName, this.image);

  Author.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        firstName = json["firstName"],
        lastName = json["lastName"],
        image = json["image"];
}
