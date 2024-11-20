import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/auth/domain/entities/user_data.dart';

abstract class AuthRepository {
  Future<Either<Exception, UserData>> login(String email, String password);
  Future<Either<Exception, dynamic>> register();
  Future<bool> saveUserData(UserData userData);
  Future<UserData?> getUserData();
}
