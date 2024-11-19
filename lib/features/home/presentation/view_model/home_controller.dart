import 'package:bases2/features/home/presentation/pages/home_pg.dart';
import 'package:bases2/features/inventories/presentation/inventories_pg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  int _currentIndex = 0;

  modifyIndex(int index) {
    _currentIndex = index;
  }

  Widget selectPage() {
    switch (_currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return const InventoriesPage();
      default:
        return const Text('Home');
    }
  }

  static HomeViewModel get findOrInitial {
    try {
      return Get.find<HomeViewModel>();
    } catch (e) {
      return Get.put(HomeViewModel());
    }
  }
}
