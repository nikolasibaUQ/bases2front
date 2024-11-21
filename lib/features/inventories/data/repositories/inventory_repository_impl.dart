import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/inventories/data/datasources/remote/inventory_api.dart';
import 'package:bases2/features/inventories/domain/entities/inventory.dart';
import 'package:bases2/features/inventories/domain/entities/new_product.dart';
import 'package:bases2/features/inventories/domain/repositories/inventory_repository.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  InventoryRepositoryImpl({required this.inventoryApi});
  final InventoryApi inventoryApi;

  @override
  Future<Either<Exception, dynamic>> addInventory(
      {required NewProduct newProduct}) async {
    return await inventoryApi.addInventory(newProduct: newProduct);
  }

  @override
  Future<Either<Exception, dynamic>> deleteInventory(
      {required int idProduct, required String idUser}) async {
    return await inventoryApi.deleteInventory(
        idProduct: idProduct, idUser: idUser);
  }

  @override
  Future<Either<Exception, List<Inventory>>> getInventory() async {
    return await inventoryApi.getInventory();
  }

  @override
  Future<Either<Exception, dynamic>> updateInventory(
      {required NewProduct newProduct}) async {
    return await inventoryApi.updateInventory(newProduct: newProduct);
  }
}
