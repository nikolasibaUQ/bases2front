import 'package:bases2/features/auth/domain/entities/user_data.dart';
import 'package:get_storage/get_storage.dart';

class LocalAuth {
  final storage = GetStorage();

  Future<bool> saveSession(UserData userData) async {
    await storage.write('userData', userData.toJson());
    return storage.read('userData') != null;
  }

  Future<UserData?> getSession() async {
    final userData = storage.read('userData');
    if (userData != null) {
      return UserData.fromJson(userData);
    }
    return null;
  }
}
