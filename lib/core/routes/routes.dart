import 'package:bases2/features/acount/presentation/pages/account_pg.dart';
import 'package:bases2/features/auth/presentation/pages/login_pg.dart';
import 'package:bases2/features/home/presentation/pages/home_pg.dart';
import 'package:bases2/features/main/presentation/pages/main_pg.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final routes = <GetPage>[
  GetPage(
    name: '/login', // Agrega el '/' al inicio
    page: () => const LoginPage(),
  ),
  GetPage(
    name: '/account', // Agrega el '/' al inicio
    page: () => const AccountPage(),
  ),
  GetPage(
    name: '/mainPage', // Agrega el '/' al inicio
    page: () => MainPage(),
  ),
  GetPage(name: '/home page', page: () => HomePage()),
];
