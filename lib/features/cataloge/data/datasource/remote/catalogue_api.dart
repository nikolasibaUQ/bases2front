import 'dart:convert';

import 'package:bases2/core/api/endpoints.dart';
import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/cataloge/domain/entities/product.dart';
import 'package:dio/dio.dart';

class CatalogueApi {
  final dio = Dio();
  Future<Either<Exception, List<Producto>>> getProducts() async {
    try {
      final response = await dio.get(Endpoints.getInventory);

      if (response.statusCode == 200) {
        List<Producto> products = [];

        for (var item in response.data['products']) {
          products.add(Producto.fromJson(item));
        }

        return Right(products);
      }
      return Left(Exception('Error al obtener los productos'));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, dynamic>> buyProducts({required Map json}) async {
    try {
      final response =
          await dio.post(Endpoints.buyProduct, data: jsonEncode(json));

      if (response.statusCode == 200) {
        return Right(response.data);
      }
      return Left(Exception('Error al comprar los productos'));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
