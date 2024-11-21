// To parse this JSON data, do
//
//     final referral = referralFromJson(jsonString);

import 'dart:convert';

Referral referralFromJson(String str) => Referral.fromJson(json.decode(str));

String referralToJson(Referral data) => json.encode(data.toJson());

class Referral {
  String idAfiliado;
  String nombre;
  String apellido;
  String email;
  String telefono;
  String direccion;
  DateTime fechaRegistro;
  int idCiudad;
  int nivel;
  int nivelEnRed;
  String codigoReferido;

  Referral({
    required this.idAfiliado,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.telefono,
    required this.direccion,
    required this.fechaRegistro,
    required this.idCiudad,
    required this.nivel,
    required this.nivelEnRed,
    required this.codigoReferido,
  });

  Referral copyWith({
    String? idAfiliado,
    String? nombre,
    String? apellido,
    String? email,
    String? telefono,
    String? direccion,
    DateTime? fechaRegistro,
    int? idCiudad,
    int? nivel,
    int? nivelEnRed,
    String? codigoReferido,
  }) =>
      Referral(
        idAfiliado: idAfiliado ?? this.idAfiliado,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        email: email ?? this.email,
        telefono: telefono ?? this.telefono,
        direccion: direccion ?? this.direccion,
        fechaRegistro: fechaRegistro ?? this.fechaRegistro,
        idCiudad: idCiudad ?? this.idCiudad,
        nivel: nivel ?? this.nivel,
        nivelEnRed: nivelEnRed ?? this.nivelEnRed,
        codigoReferido: codigoReferido ?? this.codigoReferido,
      );

  factory Referral.fromJson(Map<String, dynamic> json) => Referral(
        idAfiliado: json["idAfiliado"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        idCiudad: json["idCiudad"],
        nivel: json["nivel"],
        nivelEnRed: json["nivelEnRed"],
        codigoReferido: json["codigoReferido"],
      );

  Map<String, dynamic> toJson() => {
        "idAfiliado": idAfiliado,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "telefono": telefono,
        "direccion": direccion,
        "fechaRegistro":
            "${fechaRegistro.year.toString().padLeft(4, '0')}-${fechaRegistro.month.toString().padLeft(2, '0')}-${fechaRegistro.day.toString().padLeft(2, '0')}",
        "idCiudad": idCiudad,
        "nivel": nivel,
        "nivelEnRed": nivelEnRed,
        "codigoReferido": codigoReferido,
      };
}
