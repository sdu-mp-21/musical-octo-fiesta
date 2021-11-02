class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  User({this.id, this.firstName, this.lastName, this.email});

  User.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        firstName = json["firstName"],
        lastName = json["lastName"],
        email = json["email"];
}
