import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/inventories/domain/entities/inventory.dart';

abstract class InventoryRepository {
  Future<Either<Exception, List<Inventory>>> getInventory(
      {required String userId});
  Future<Either<Exception, dynamic>> addInventory(dynamic inventory);
  Future<Either<Exception, dynamic>> updateInventory(dynamic inventory);
  Future<Either<Exception, dynamic>> deleteInventory(dynamic inventory);
}
