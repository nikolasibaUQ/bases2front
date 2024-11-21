import 'package:bases2/features/referrals/presentation/view_model/referrals_vm.dart';
import 'package:bases2/shared/colors/colors.dart';
import 'package:bases2/shared/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferralsPage extends StatelessWidget {
  const ReferralsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ReferralsViewmodel.findOrInitial;
    final responsive = Responsive(context);
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.all(responsive.hp(2)),
            child: Text(
              'Mi Red de Referidos',
              style: TextStyle(
                  color: MyColors.primary,
                  fontSize: responsive.fpw(25),
                  fontWeight: FontWeight.bold),
            )),
        Obx(() => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    border: TableBorder.all(
                      color: MyColors.primary,
                      width: 1.5,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    columns: const [
                      DataColumn(label: Text('Id Referido')),
                      DataColumn(label: Text('Nombre')),
                      DataColumn(label: Text('Apellido')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Teléfono')),
                      DataColumn(label: Text('Dirección')),
                      DataColumn(label: Text('Ciudad')),
                      DataColumn(label: Text('Fecha de \nRegistro')),
                      DataColumn(label: Flexible(child: Text('Nivel'))),
                      DataColumn(label: Text('Nivel de \nReferido')),
                      DataColumn(label: Text('codigo de \nReferido')),
                    ],
                    rows: controller.referrals
                        .map((e) => DataRow(cells: [
                              DataCell(SizedBox(
                                  width: responsive.wp(5),
                                  child: Text(e.idAfiliado))),
                              DataCell(SizedBox(
                                  width: responsive.wp(5),
                                  child: Text(e.nombre))),
                              DataCell(SizedBox(
                                  width: responsive.wp(5),
                                  child: Text(e.apellido))),
                              DataCell(SizedBox(
                                  width: responsive.wp(5),
                                  child: Text(e.email))),
                              DataCell(SizedBox(
                                  width: responsive.wp(5),
                                  child: Text(e.telefono))),
                              DataCell(SizedBox(
                                  width: responsive.wp(5),
                                  child: Text(e.direccion))),
                              DataCell(SizedBox(
                                  width: responsive.wp(5),
                                  child: Text(e.idCiudad.toString()))),
                              DataCell(SizedBox(
                                  width: responsive.wp(5),
                                  child: Text(e.fechaRegistro
                                      .toString()
                                      .substring(0, 11)))),
                              DataCell(SizedBox(
                                  width: responsive.wp(5),
                                  child: Text(e.nivel.toString()))),
                              DataCell(SizedBox(
                                  width: responsive.wp(5),
                                  child: Text(e.nivelEnRed.toString()))),
                              DataCell(SizedBox(
                                  width: responsive.wp(5),
                                  child: Text(e.codigoReferido))),
                            ]))
                        .toList()),
              ),
            )),
      ],
    );
  }
}
