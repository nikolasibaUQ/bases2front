import 'package:bases2/features/auth/presentation/view_model/auth_controller.dart';
import 'package:bases2/shared/colors/colors.dart';
import 'package:bases2/shared/utils/image_paths.dart';
import 'package:bases2/shared/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final controller = AuthController.findOrInitialized;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: MyColors.primary,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenido a MandalApp',
                    style: TextStyle(
                      color: MyColors.secondary,
                      fontSize: responsive.fpw(24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    AssetsPaths.images.logo,
                    height: responsive.hp(40),
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              Center(
                child: Container(
                  width: responsive.wp(30),
                  height: responsive.dp(30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(
                    child: Obx(() => !controller.isRegister.value
                        ? LoginContent(
                            responsive: responsive, controller: controller)
                        : RegisterContent(
                            responsive: responsive, controller: controller)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent({
    super.key,
    required this.responsive,
    required this.controller,
  });

  final Responsive responsive;
  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: responsive.hp(8)),
        Padding(
          padding: EdgeInsets.all(responsive.dp(.5)),
          child: Text(
            'inicia sesión',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyColors.secondary,
              fontSize: responsive.fpw(24),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: responsive.hp(6)),
        Container(
          margin: EdgeInsets.only(top: responsive.hp(2)),
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: TextField(
            onChanged: (value) => controller.changeUsername(value),
            decoration: InputDecoration(
              hintText: 'Usuario',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.hp(2)),
        Container(
          margin: EdgeInsets.only(top: responsive.hp(2)),
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: TextField(
            onChanged: (value) => controller.changePassword(value),
            decoration: InputDecoration(
              hintText: 'Contraseña',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.violetBlue),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.hp(6)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.secondary,
              fixedSize: Size(responsive.wp(20), responsive.hp(5)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: MyColors.violetBlue),
              ),
            ),
            onPressed: () async {
              await controller.login();
            },
            child: Text(
              'Iniciar sesión',
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.fpw(16),
                fontWeight: FontWeight.bold,
              ),
            )),
        SizedBox(height: responsive.hp(2)),
        InkWell(
          onTap: () {},
          child: Center(
            child: Text(
              '¿Olvidaste tu contraseña?',
              style: TextStyle(
                  color: MyColors.violetBlue,
                  fontSize: responsive.fpw(16),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: responsive.hp(2)),
        InkWell(
          onTap: () => controller.changeIsRegister(),
          child: Center(
            child: Text(
              'Regístrate',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: MyColors.violetBlue,
                  fontSize: responsive.fpw(16),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterContent extends StatelessWidget {
  const RegisterContent({
    super.key,
    required this.responsive,
    required this.controller,
  });

  final Responsive responsive;
  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: MyColors.secondary,
      fontSize: responsive.fpw(16),
      fontWeight: FontWeight.bold,
    );
    return Column(
      children: [
        SizedBox(height: responsive.hp(8)),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: responsive.wp(2)),
            child: InkWell(
              onTap: () => controller.changeIsRegister(),
              child: Icon(
                Icons.arrow_back,
                color: MyColors.secondary,
                size: responsive.dp(2),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(responsive.dp(.5)),
          child: Text(
            'Registrate',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyColors.secondary,
              fontSize: responsive.fpw(24),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: responsive.hp(6)),
        Text('1. Ingrese sus datos para acceder', style: style),
        Container(
          margin: EdgeInsets.only(top: responsive.hp(2)),
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: TextField(
            onChanged: (value) => controller.changeUsername(value),
            decoration: InputDecoration(
              hintText: 'Usuario',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.hp(2)),
        Container(
          margin: EdgeInsets.only(top: responsive.hp(2)),
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: TextField(
            onChanged: (value) => controller.changePassword(value),
            decoration: InputDecoration(
              hintText: 'Contraseña',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.violetBlue),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.hp(6)),
        Text('2. Ingrese sus datos personales', style: style),
        Container(
          margin: EdgeInsets.only(top: responsive.hp(2)),
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: TextField(
            onChanged: (value) => controller.changeUsername(value),
            decoration: InputDecoration(
              hintText: 'Nombre',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.hp(2)),
        Container(
          margin: EdgeInsets.only(top: responsive.hp(2)),
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: TextField(
            onChanged: (value) => controller.changePassword(value),
            decoration: InputDecoration(
              hintText: 'Apellido',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.violetBlue),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.hp(2)),
        Container(
          margin: EdgeInsets.only(top: responsive.hp(2)),
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: TextField(
            onChanged: (value) => controller.changePassword(value),
            decoration: InputDecoration(
              hintText: 'Correo',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.violetBlue),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.hp(2)),
        Container(
          margin: EdgeInsets.only(top: responsive.hp(2)),
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: TextField(
            onChanged: (value) => controller.changePassword(value),
            decoration: InputDecoration(
              hintText: 'Teléfono',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.violetBlue),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.hp(2)),
        Container(
          margin: EdgeInsets.only(top: responsive.hp(2)),
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: TextField(
            onChanged: (value) => controller.changePassword(value),
            decoration: InputDecoration(
              hintText: 'Dirección',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.violetBlue),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.hp(2)),
        Container(
          margin: EdgeInsets.only(top: responsive.hp(2)),
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: TextField(
            onChanged: (value) => controller.changePassword(value),
            decoration: InputDecoration(
              hintText: 'Ciudad (1 al 5)',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.violetBlue),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.hp(2)),
        Text('3. Ingrese el codigo de referido', style: style),
        Container(
          margin: EdgeInsets.only(top: responsive.hp(2)),
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: TextField(
            onChanged: (value) => controller.changePassword(value),
            decoration: InputDecoration(
              hintText: 'Código',
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.violetBlue),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: responsive.hp(6)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.secondary,
              fixedSize: Size(responsive.wp(20), responsive.hp(5)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: MyColors.violetBlue),
              ),
            ),
            onPressed: () async {
              await controller.login();
            },
            child: Text(
              'Registrarme',
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.fpw(16),
                fontWeight: FontWeight.bold,
              ),
            )),
        SizedBox(height: responsive.hp(5)),
      ],
    );
  }
}
