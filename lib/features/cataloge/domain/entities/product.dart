// To parse this JSON data, do
//
//     final producto = productoFromJson(jsonString);

import 'dart:convert';

Producto productoFromJson(String str) => Producto.fromJson(json.decode(str));

String productoToJson(Producto data) => json.encode(data.toJson());

class Producto {
  int idProducto;
  String nombre;
  String descripcion;
  String precio;
  int cantidad;

  Producto({
    required this.idProducto,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.cantidad,
  });

  Producto copyWith({
    int? idProducto,
    String? nombre,
    String? descripcion,
    String? precio,
    int? cantidad,
  }) =>
      Producto(
        idProducto: idProducto ?? this.idProducto,
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        precio: precio ?? this.precio,
        cantidad: cantidad ?? this.cantidad,
      );

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
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
