import 'package:bases2/features/auth/data/datasources/remote/auth_api.dart';
import 'package:bases2/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;

  AuthRepositoryImpl({required this.authApi});
  @override
  Future login(String email, String password) {
    return authApi.login(email, password);
  }

  @override
  Future register() {
    throw UnimplementedError();
  }
}
