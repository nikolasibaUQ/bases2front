// To parse this JSON data, do
//
//     final inventory = inventoryFromJson(jsonString);

import 'dart:convert';

Inventory inventoryFromJson(String str) => Inventory.fromJson(json.decode(str));

String inventoryToJson(Inventory data) => json.encode(data.toJson());

class Inventory {
  int idProducto;
  String nombre;
  String descripcion;
  String precio;
  int cantidad;

  Inventory({
    required this.idProducto,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.cantidad,
  });

  Inventory copyWith({
    int? idProducto,
    String? nombre,
    String? descripcion,
    String? precio,
    int? cantidad,
  }) =>
      Inventory(
        idProducto: idProducto ?? this.idProducto,
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        precio: precio ?? this.precio,
        cantidad: cantidad ?? this.cantidad,
      );

  factory Inventory.fromJson(Map<dynamic, dynamic> json) => Inventory(
        idProducto: json["idProducto"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        cantidad: json["cantidad"],
      );

  Map<String, dynamic> toJson() => {
        "idProducto": idProducto,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "cantidad": cantidad,
      };
}
