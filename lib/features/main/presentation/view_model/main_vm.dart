import 'package:bases2/features/acount/presentation/pages/account_pg.dart';
import 'package:bases2/features/home/presentation/pages/home_pg.dart';
import 'package:bases2/features/inventories/presentation/inventories_pg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainViewModel extends GetxController {
  final RxInt _currentIndex = 0.obs;

  modifyIndex(int index) {
    _currentIndex.value = index;
    update();
  }

  Widget selectPage() {
    switch (_currentIndex.value) {
      case 0:
        return HomePage();
      case 1:
        return const InventoriesPage();
      case 2:
        return const AccountPage();
      default:
        return const Text('Home');
    }
  }

  static MainViewModel get findOrInitial {
    try {
      return Get.find<MainViewModel>();
    } catch (e) {
      return Get.put(MainViewModel());
    }
  }
}
