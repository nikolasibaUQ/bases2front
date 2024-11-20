import 'package:bases2/core/api/endpoints.dart';
import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/inventories/domain/entities/inventory.dart';
import 'package:dio/dio.dart';

class InventoryApi {
  final dio = Dio();

  Future<Either<Exception, List<Inventory>>> getInventory(
      {required String userId}) async {
    try {
      //aqui agrego al url ?idAfiliado=$userId
      final response = await dio.get(
        Endpoints.getInventory,
        queryParameters: {'idAfiliado': userId},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
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

  Future<Either<Exception, dynamic>> addInventory(dynamic inventory) async {
    return throw UnimplementedError();
  }

  Future<Either<Exception, dynamic>> updateInventory(dynamic inventory) async {
    return throw UnimplementedError();
  }

  Future<Either<Exception, dynamic>> deleteInventory(dynamic inventory) async {
    return throw UnimplementedError();
  }
}
