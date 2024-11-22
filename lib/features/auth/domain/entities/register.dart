// To parse this JSON data, do
//
//     final registro = registroFromJson(jsonString);

import 'dart:convert';

Registro registroFromJson(String str) => Registro.fromJson(json.decode(str));

String registroToJson(Registro data) => json.encode(data.toJson());

class Registro {
  String idAfiliado;
  String nombre;
  String apellido;
  String email;
  String telefono;
  String direccion;
  String fechaRegistro;
  int idCiudad;
  String username;
  String password;
  String codigoReferido;

  Registro({
    required this.idAfiliado,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.telefono,
    required this.direccion,
    required this.fechaRegistro,
    required this.idCiudad,
    required this.username,
    required this.password,
    required this.codigoReferido,
  });

  Registro copyWith({
    String? idAfiliado,
    String? nombre,
    String? apellido,
    String? email,
    String? telefono,
    String? direccion,
    String? fechaRegistro,
    int? idCiudad,
    String? username,
    String? password,
    String? codigoReferido,
  }) =>
      Registro(
        idAfiliado: idAfiliado ?? this.idAfiliado,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        email: email ?? this.email,
        telefono: telefono ?? this.telefono,
        direccion: direccion ?? this.direccion,
        fechaRegistro: fechaRegistro ?? this.fechaRegistro,
        idCiudad: idCiudad ?? this.idCiudad,
        username: username ?? this.username,
        password: password ?? this.password,
        codigoReferido: codigoReferido ?? this.codigoReferido,
      );

  factory Registro.fromJson(Map<String, dynamic> json) => Registro(
        idAfiliado: json["id_afiliado"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        fechaRegistro: json["fechaRegistro"],
        idCiudad: json["idCiudad"],
        username: json["username"],
        password: json["password"],
        codigoReferido: json["codigoReferido"],
      );

  Map<String, dynamic> toJson() => {
        "id_afiliado": idAfiliado,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "telefono": telefono,
        "direccion": direccion,
        "fechaRegistro": fechaRegistro,
        "idCiudad": idCiudad,
        "username": username,
        "password": password,
        "codigoReferido": codigoReferido,
      };
}
