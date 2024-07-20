// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? authtoken;
  User? user;

  UserModel({
    this.authtoken,
    this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    authtoken: json["authtoken"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "authtoken": authtoken,
    "user": user?.toJson(),
  };
}

class User {
  String? id;
  String? username;
  String? email;
  int? v;

  User({
    this.id,
    this.username,
    this.email,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "email": email,
    "__v": v,
  };
}
