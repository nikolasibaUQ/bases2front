import 'package:get/get.dart';

class InventoriesViewModel extends GetxController {
  static InventoriesViewModel get findOrInitial {
    try {
      return Get.find();
    } catch (e) {
      return Get.put(InventoriesViewModel());
    }
  }
}
