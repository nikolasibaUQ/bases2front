import 'package:bases2/features/auth/data/datasources/local/local_auth.dart';
import 'package:bases2/features/auth/data/datasources/remote/auth_api.dart';
import 'package:bases2/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bases2/features/auth/domain/repositories/auth_repository.dart';
import 'package:bases2/features/main/presentation/pages/main_pg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepositoryImpl(
    authApi: AuthApi(),
    localAuth: LocalAuth(),
  );

  final _username = TextEditingController();
  final _password = TextEditingController();

  RxBool isRegister = false.obs;

  changeUsername(String value) {
    _username.text = value;
  }

  changePassword(String value) {
    _password.text = value;
  }
  //
  //

  void changeIsRegister() {
    isRegister.value = !isRegister.value;
  }

  Future<void> login() async {
    if (_username.text.isEmpty) {
      return;
    }
    if (_password.text.isEmpty) {
      return;
    }

    final response =
        await _authRepository.login(_username.text, _password.text);
    response.fold(
      (left) => Get.snackbar(
        'Error',
        left.toString(),
        backgroundColor: Colors.red,
      ),
      (rigth) async {
        final isSave = await _authRepository.saveUserData(rigth);
        if (!isSave) {
          Get.snackbar(
            'Error',
            'No se pudo guardar la sesion',
            backgroundColor: Colors.red,
          );
          return;
        }

        Get.snackbar(
          'Bienvenido',
          'Es un placer verte aqui ${rigth.name! + rigth.lastName!}',
          backgroundColor: Colors.green,
        );
        Future.delayed(
          const Duration(seconds: 2),
          () => Get.offAll(() => MainPage()),
        );
      },
    );
  }

//how call this controller from another file or class or widget
//for be able to call this controller from another file or class or widget
  static AuthController get findOrInitialized {
    try {
      return Get.find<AuthController>();
    } catch (e) {
      return Get.put(AuthController());
    }
  }
}
