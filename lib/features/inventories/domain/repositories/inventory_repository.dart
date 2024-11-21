import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/inventories/domain/entities/inventory.dart';
import 'package:bases2/features/inventories/domain/entities/new_product.dart';

abstract class InventoryRepository {
  Future<Either<Exception, List<Inventory>>> getInventory();
  Future<Either<Exception, dynamic>> addInventory(
      {required NewProduct newProduct});
  Future<Either<Exception, dynamic>> updateInventory(
      {required NewProduct newProduct});
  Future<Either<Exception, dynamic>> deleteInventory(
      {required int idProduct, required String idUser});
}
