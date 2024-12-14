import 'dart:convert';

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  String message;
  int responseCode;
  User user;

  AuthModel({
    required this.message,
    required this.responseCode,
    required this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        message: json["message"],
        responseCode: json["response_code"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "response_code": responseCode,
        "user": user.toJson(),
      };
}

class User {
  String fname;
  String lname;
  String username;
  String email;
  String profilePic;

  User({
    required this.fname,
    required this.lname,
    required this.username,
    required this.email,
    required this.profilePic,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        fname: json["fname"],
        lname: json["lname"],
        username: json["username"],
        email: json["email"],
        profilePic: json["profile_pic"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "username": username,
        "email": email,
        "profile_pic": profilePic,
      };
}
