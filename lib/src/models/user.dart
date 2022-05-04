// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:rapidfast_delivery/src/models/rol.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User(
      {this.id,
      this.email,
      this.name,
      this.lastname,
      this.phone,
      this.image,
      this.password,
      this.isAvailable,
      this.sessionToken,
      this.createdAt,
      this.updatedAt,
      this.roles});

  String id;
  String email;
  String name;
  String lastname;
  String phone;
  String image;
  String password;
  bool isAvailable;
  String sessionToken;
  int createdAt;
  int updatedAt;
  List<Rol> roles = [];

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        email: json["email"],
        name: json["name"],
        lastname: json["lastname"],
        phone: json["phone"],
        image: json["image"],
        password: json["password"],
        isAvailable: json["is_available"],
        sessionToken: json["session_token"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        roles: json["roles"] == null
            ? []
            : List<Rol>.from(
                    json["roles"].map((model) => Rol.fromJson(model))) ??
                [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "lastname": lastname,
        "phone": phone,
        "image": image,
        "password": password,
        "is_available": isAvailable,
        "session_token": sessionToken,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "roles": roles,
      };
}
