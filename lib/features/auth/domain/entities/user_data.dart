import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  String message;
  String id;
  String name;
  String lastName;
  String email;
  String phone;
  String street;
  String ciudad;
  String nivel;
  int idnivel;
  int comision;

  UserData({
    required this.message,
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.street,
    required this.ciudad,
    required this.nivel,
    required this.idnivel,
    required this.comision,
  });

  UserData copyWith({
    String? message,
    String? id,
    String? name,
    String? lastName,
    String? email,
    String? phone,
    String? street,
    String? ciudad,
    String? nivel,
    int? idnivel,
    int? comision,
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
        nivel: nivel ?? this.nivel,
        idnivel: idnivel ?? this.idnivel,
        comision: comision ?? this.comision,
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
        nivel: json["nivel"],
        idnivel: json["idnivel"],
        comision: json["comision"],
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
        "nivel": nivel,
        "idnivel": idnivel,
        "comision": comision,
      };
}
