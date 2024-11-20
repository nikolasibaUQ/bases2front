import 'package:get/get.dart';

class AccountViewModel extends GetxController {
  //
  //
  static AccountViewModel get findOrInitial {
    try {
      return Get.find<AccountViewModel>();
    } catch (e) {
      return Get.put(AccountViewModel());
    }
  }
}
