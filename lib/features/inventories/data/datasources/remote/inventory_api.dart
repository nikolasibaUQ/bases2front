import 'package:bases2/core/api/endpoints.dart';
import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/inventories/domain/entities/inventory.dart';
import 'package:bases2/features/inventories/domain/entities/new_product.dart';
import 'package:dio/dio.dart';

class InventoryApi {
  final dio = Dio();

  Future<Either<Exception, List<Inventory>>> getInventory() async {
    try {
      //aqui agrego al url ?idAfiliado=$userId
      final response = await dio.get(
        Endpoints.getInventory,
      );

      if (response.statusCode == 200) {
        final List<Inventory> inventories = [];
        response.data['products'].forEach((inventory) {
          inventories.add(Inventory.fromJson(inventory));
        });
        return Right(inventories);
      } else {
        return Left(Exception('Error'));
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }

  Future<Either<Exception, dynamic>> addInventory(
      {required NewProduct newProduct}) async {
    try {
      final response = await dio.post(
        Endpoints.addInventory,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: newProduct.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(Exception('Error'));
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }

  Future<Either<Exception, dynamic>> updateInventory(
      {required NewProduct newProduct}) async {
    try {
      final response = await dio.put(
        Endpoints.updateInventory,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: newProduct.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(Exception('Error'));
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }

  Future<Either<Exception, dynamic>> deleteInventory(
      {required int idProduct, required String idUser}) async {
    try {
      final response = await dio.post(
        Endpoints.deleteInventory,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        queryParameters: {
          'idProducto': idProduct,
          'idAfiliado': idUser,
        },
      );

      if (response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left(Exception('Error'));
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
