import 'dart:async';
import 'dart:math';

import 'package:bases2/features/auth/data/datasources/local/local_auth.dart';
import 'package:bases2/features/auth/data/datasources/remote/auth_api.dart';
import 'package:bases2/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bases2/features/auth/domain/repositories/auth_repository.dart';
import 'package:bases2/features/inventories/data/datasources/remote/inventory_api.dart';
import 'package:bases2/features/inventories/data/repositories/inventory_repository_impl.dart';
import 'package:bases2/features/inventories/domain/entities/inventory.dart';
import 'package:bases2/features/inventories/domain/entities/new_product.dart';
import 'package:bases2/features/inventories/domain/repositories/inventory_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoriesViewModel extends GetxController {
  @override
  void onInit() async {
    await getInventories();
    super.onInit();
  }

  TextEditingController idProductController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();

  final InventoryRepository _inventoryRepository =
      InventoryRepositoryImpl(inventoryApi: InventoryApi());
  final AuthRepository _authRepository =
      AuthRepositoryImpl(authApi: AuthApi(), localAuth: LocalAuth());

  RxList<Inventory> inventories = <Inventory>[].obs;

  Future<void> getInventories() async {
    final result = await _inventoryRepository.getInventory();

    result.fold(
        (left) => Get.snackbar(
            backgroundColor: Colors.red,
            'Error',
            'Error al obtener los inventarios: ${left.toString()}'),
        (rigth) => inventories.value = rigth);
  }

  Future<void> deleteInventory(Inventory inventory) async {
    final user = await _authRepository.getUserData();

    if (user!.idnivel != 1) {
      Get.snackbar(
          backgroundColor: Colors.red,
          'Error',
          'No tienes permisos para crear nuevos productos');
      return;
    }
    final result = await _inventoryRepository.deleteInventory(
        idProduct: inventory.idProducto, idUser: user.id);

    result.fold((left) async {
      Get.close(1);
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar(
          backgroundColor: Colors.red,
          'Error',
          'Error al eliminar el inventario: ${left.toString()}');
    }, (rigth) async {
      Get.close(1);
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar(backgroundColor: Colors.green, 'Exito', rigth.toString());
      await getInventories();
    });
  }

  Future<void> createNewProduct() async {
    final user = await _authRepository.getUserData();
    if (user!.idnivel != 1) {
      Get.snackbar(
          backgroundColor: Colors.red,
          'Error',
          'No tienes permisos para crear nuevos productos');
      return;
    }
    NewProduct newProduct = NewProduct(
      descripcion: productDescriptionController.text,
      idAfiliado: user.id,
      nombre: productNameController.text,
      idProducto: idProductController.text.isEmpty
          ? Random().nextInt(100000)
          : int.parse(idProductController.text),
      precio: int.parse(productPriceController.text),
      cantidad: int.parse(productQuantityController.text),
    );

    final result =
        await _inventoryRepository.addInventory(newProduct: newProduct);

    result.fold((left) async {
      Get.close(1);
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar(
          backgroundColor: Colors.red,
          'Error',
          'Error al crear el inventario: ${left.toString()}');
    }, (rigth) async {
      Get.close(1);
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar(backgroundColor: Colors.green, 'Exito', rigth.toString());
      await getInventories();
    });
  }

  Future<void> updateProduct() async {
    final user = await _authRepository.getUserData();
    if (user!.idnivel != 1) {
      Get.snackbar(
          backgroundColor: Colors.red,
          'Error',
          'No tienes permisos para editar productos');
      return;
    }
    NewProduct newProduct = NewProduct(
      descripcion: productDescriptionController.text,
      idAfiliado: user.id,
      nombre: productNameController.text,
      idProducto: int.parse(idProductController.text),
      precio: int.parse(productPriceController.text),
      cantidad: int.parse(productQuantityController.text),
    );

    final result =
        await _inventoryRepository.updateInventory(newProduct: newProduct);

    result.fold((left) async {
      Get.close(1);
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar(
          backgroundColor: Colors.red,
          'Error',
          'Error al editar el inventario: ${left.toString()}');
    }, (rigth) async {
      Get.close(1);
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar(backgroundColor: Colors.green, 'Exito', rigth.toString());
      await getInventories();
    });
  }

  setControllersData(Inventory inventory) {
    idProductController.text = inventory.idProducto.toString();
    productNameController.text = inventory.nombre;
    productDescriptionController.text = inventory.descripcion;
    productPriceController.text = inventory.precio.toString();
    productQuantityController.text = inventory.cantidad.toString();
  }

  static InventoriesViewModel get findOrInitial {
    try {
      return Get.find();
    } catch (e) {
      return Get.put(InventoriesViewModel());
    }
  }

  Future<void> clearControllers() async {
    idProductController.text = '';
    productNameController.text = '';
    productDescriptionController.text = '';
    productPriceController.text = '';
    productQuantityController.text = '';
    refresh();
  }
}
