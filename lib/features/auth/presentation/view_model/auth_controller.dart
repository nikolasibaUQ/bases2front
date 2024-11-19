import 'package:get/get.dart';

class AuthController extends GetxController {
  //
  //

//how call this controller from another file or class or widget
//for be able to call this controller from another file or class or widget
  static Future<AuthController> get findOrInitialized async {
    try {
      return Get.find<AuthController>();
    } catch (e) {
      return Get.put(AuthController());
    }
  }
}
