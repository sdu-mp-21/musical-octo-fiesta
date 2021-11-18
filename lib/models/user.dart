class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  User({this.firstName, this.lastName, this.email, this.password});

  User.fromJson(Map<String, dynamic> json)
      : firstName = json["firstName"],
        lastName = json["lastName"],
        email = json["email"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastname": lastName,
        "email": email,
        "password": password,
      };
}
