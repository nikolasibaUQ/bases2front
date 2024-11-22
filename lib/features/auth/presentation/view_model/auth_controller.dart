import 'package:bases2/features/auth/data/datasources/local/local_auth.dart';
import 'package:bases2/features/auth/data/datasources/remote/auth_api.dart';
import 'package:bases2/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bases2/features/auth/domain/entities/register.dart';
import 'package:bases2/features/auth/domain/repositories/auth_repository.dart';
import 'package:bases2/features/main/presentation/pages/main_pg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepositoryImpl(
    authApi: AuthApi(),
    localAuth: LocalAuth(),
  );

  final username = TextEditingController();
  final password = TextEditingController();

  final id = TextEditingController();
  final name = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final reference = TextEditingController();

  RxBool isRegister = false.obs;

  changeUsername(String value) {
    username.text = value;
  }

  changePassword(String value) {
    password.text = value;
  }

  changeId(String value) {
    id.text = value;
  }

  changeName(String value) {
    name.text = value;
  }

  changeLastName(String value) {
    lastName.text = value;
  }

  changeEmail(String value) {
    email.text = value;
  }

  changePhone(String value) {
    phone.text = value;
  }

  changeAddress(String value) {
    address.text = value;
  }

  changeCity(String value) {
    city.text = value;
  }

  changeReference(String value) {
    reference.text = value;
  }

  void changeIsRegister() {
    isRegister.value = !isRegister.value;
  }

  Future<void> login() async {
    if (username.text.isEmpty) {
      return;
    }
    if (password.text.isEmpty) {
      return;
    }

    final response = await _authRepository.login(username.text, password.text);
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
          'Es un placer verte aqui ${rigth.name + rigth.lastName}',
          backgroundColor: Colors.green,
        );
        Future.delayed(
          const Duration(seconds: 2),
          () => Get.offAll(() => MainPage()),
        );
      },
    );
  }

  Future<void> register() async {
    if (id.text.isEmpty) {
      return;
    }
    if (name.text.isEmpty) {
      return;
    }
    if (lastName.text.isEmpty) {
      return;
    }
    if (email.text.isEmpty) {
      return;
    }
    if (phone.text.isEmpty) {
      return;
    }
    if (address.text.isEmpty) {
      return;
    }
    if (city.text.isEmpty) {
      return;
    }
    if (reference.text.isEmpty) {
      return;
    }

    final registro = Registro(
        idAfiliado: id.value.text,
        nombre: name.value.text,
        apellido: lastName.value.text,
        email: email.value.text,
        telefono: phone.value.text,
        direccion: address.value.text,
        fechaRegistro: DateTime.now().toString(),
        idCiudad: int.parse(city.value.text),
        username: username.value.text,
        password: password.value.text,
        codigoReferido: reference.value.text);

    final response = await _authRepository.register(
      register: registro,
    );

    response.fold(
      (left) => Get.snackbar(
        'Error',
        left.toString(),
        backgroundColor: Colors.red,
      ),
      (rigth) async {
        clearControllers();
        Get.close(1);
        changeIsRegister();
        Get.snackbar(
          'Registro Exitoso',
          'su registro a sido exitoso',
          backgroundColor: Colors.green,
        );
      },
    );
  }

  clearControllers() {
    username.clear();
    password.clear();
    id.clear();
    name.clear();
    lastName.clear();
    email.clear();
    phone.clear();
    address.clear();
    city.clear();
    reference.clear();
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
