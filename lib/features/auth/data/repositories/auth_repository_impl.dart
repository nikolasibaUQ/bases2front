import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/auth/data/datasources/local/local_auth.dart';
import 'package:bases2/features/auth/data/datasources/remote/auth_api.dart';
import 'package:bases2/features/auth/domain/entities/register.dart';
import 'package:bases2/features/auth/domain/entities/user_data.dart';
import 'package:bases2/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;
  final LocalAuth localAuth;

  AuthRepositoryImpl({
    required this.localAuth,
    required this.authApi,
  });
  @override
  Future<Either<Exception, UserData>> login(
      String email, String password) async {
    return await authApi.login(email, password);
  }

  @override
  Future<Either<Exception, String>> register({required Registro register}) {
    return authApi.register(register: register);
  }

  @override
  Future<UserData?> getUserData() async {
    return await localAuth.getSession();
  }

  @override
  Future<bool> saveUserData(UserData userData) async {
    return await localAuth.saveSession(userData);
  }
}
