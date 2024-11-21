// To parse this JSON data, do
//
//     final newProduct = newProductFromJson(jsonString);

import 'dart:convert';

NewProduct newProductFromJson(String str) =>
    NewProduct.fromJson(json.decode(str));

String newProductToJson(NewProduct data) => json.encode(data.toJson());

class NewProduct {
  int idProducto;
  String nombre;
  String descripcion;
  int precio;
  String idAfiliado;
  int cantidad;

  NewProduct({
    required this.idProducto,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.idAfiliado,
    required this.cantidad,
  });

  NewProduct copyWith({
    int? idProducto,
    String? nombre,
    String? descripcion,
    int? precio,
    String? idAfiliado,
    int? cantidad,
  }) =>
      NewProduct(
        idProducto: idProducto ?? this.idProducto,
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        precio: precio ?? this.precio,
        idAfiliado: idAfiliado ?? this.idAfiliado,
        cantidad: cantidad ?? this.cantidad,
      );

  factory NewProduct.fromJson(Map<String, dynamic> json) => NewProduct(
        idProducto: json["idProducto"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        idAfiliado: json["idAfiliado"],
        cantidad: json["cantidad"],
      );

  Map<String, dynamic> toJson() => {
        "idProducto": idProducto,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "idAfiliado": idAfiliado,
        "cantidad": cantidad,
      };
}
