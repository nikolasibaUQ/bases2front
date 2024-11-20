import 'package:bases2/features/inventories/view_model/inventories_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class InventoriesPage extends StatelessWidget {
  const InventoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DataTableInventorie(),
      ],
    );
  }
}

class DataTableInventorie extends StatelessWidget {
  const DataTableInventorie({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = InventoriesViewModel.findOrInitial;
    return Obx(() => DataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Description')),
              DataColumn(label: Text('quantity')),
              DataColumn(label: Text('idInventory')),
            ],
            rows: controller.inventories.map((inventory) {
              return DataRow(cells: [
                DataCell(Text(inventory.idProducto.toString())),
                DataCell(Text(inventory.nombre)),
                DataCell(Text(inventory.descripcion)),
                DataCell(Text(inventory.cantidad.toString())),
                DataCell(Text(inventory.cantidad.toString())),
              ]);
            }).toList()));
  }
}
