// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  String? message;
  String? id;
  String? name;
  String? lastName;
  String? email;
  String? phone;
  String? street;
  int? ciudad;

  UserData({
    this.message,
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.phone,
    this.street,
    this.ciudad,
  });

  UserData copyWith({
    String? message,
    String? id,
    String? name,
    String? lastName,
    String? email,
    String? phone,
    String? street,
    int? ciudad,
  }) =>
      UserData(
        message: message ?? this.message,
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        street: street ?? this.street,
        ciudad: ciudad ?? this.ciudad,
      );

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        message: json["message"],
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        street: json["street"],
        ciudad: json["ciudad"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
        "name": name,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "street": street,
        "ciudad": ciudad,
      };
}
