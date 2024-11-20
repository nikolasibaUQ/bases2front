import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/inventories/data/datasources/remote/inventory_api.dart';
import 'package:bases2/features/inventories/domain/entities/inventory.dart';
import 'package:bases2/features/inventories/domain/repositories/inventory_repository.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  InventoryRepositoryImpl({required this.inventoryApi});
  final InventoryApi inventoryApi;

  @override
  Future<Either<Exception, dynamic>> addInventory(dynamic inventory) async {
    return await inventoryApi.addInventory(inventory);
  }

  @override
  Future<Either<Exception, dynamic>> deleteInventory(inventory) async {
    return await inventoryApi.deleteInventory(inventory);
  }

  @override
  Future<Either<Exception, List<Inventory>>> getInventory(
      {required String userId}) async {
    return await inventoryApi.getInventory(userId: userId);
  }

  @override
  Future<Either<Exception, dynamic>> updateInventory(inventory) async {
    return await inventoryApi.updateInventory(inventory);
  }
}
