import 'package:bases2/shared/utils/responsive.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return SingleChildScrollView(
      child: Column(children: [
        Text(
          'Datos de mi cuenta',
          style: TextStyle(
            fontSize: responsive.fpw(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: responsive.hp(30),
          width: responsive.wp(60),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                'Código para referidos: AFF1113314529',
                style: TextStyle(
                  fontSize: responsive.fpw(22),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.person, size: responsive.dp(5)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nombre: Nicolas',
                        style: TextStyle(
                          fontSize: responsive.fpw(18),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Correo: Ibañez',
                        style: TextStyle(
                          fontSize: responsive.fpw(18),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
