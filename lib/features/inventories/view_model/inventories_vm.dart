import 'package:bases2/features/auth/data/datasources/local/local_auth.dart';
import 'package:bases2/features/auth/data/datasources/remote/auth_api.dart';
import 'package:bases2/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bases2/features/auth/domain/repositories/auth_repository.dart';
import 'package:bases2/features/inventories/data/datasources/remote/inventory_api.dart';
import 'package:bases2/features/inventories/data/repositories/inventory_repository_impl.dart';
import 'package:bases2/features/inventories/domain/entities/inventory.dart';
import 'package:bases2/features/inventories/domain/repositories/inventory_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoriesViewModel extends GetxController {
  @override
  void onInit() async {
    await getInventories();
    super.onInit();
  }

  final InventoryRepository _inventoryRepository =
      InventoryRepositoryImpl(inventoryApi: InventoryApi());
  final AuthRepository _authRepository =
      AuthRepositoryImpl(authApi: AuthApi(), localAuth: LocalAuth());

  RxList<Inventory> inventories = <Inventory>[].obs;

  Future<void> getInventories() async {
    final user = await _authRepository.getUserData();
    final result = await _inventoryRepository.getInventory(userId: user!.id!);

    result.fold(
        (left) => Get.snackbar(
            backgroundColor: Colors.red,
            'Error',
            'Error al obtener los inventarios: ${left.toString()}'),
        (rigth) => inventories.value = rigth);
  }

  static InventoriesViewModel get findOrInitial {
    try {
      return Get.find();
    } catch (e) {
      return Get.put(InventoriesViewModel());
    }
  }
}
