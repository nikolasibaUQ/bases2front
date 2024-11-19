import 'package:flutter/material.dart';

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
    return DataTable(
      columns: const [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Description')),
        DataColumn(label: Text('quantity')),
        DataColumn(label: Text('idInventory')),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('name')),
          DataCell(Text('description')),
          DataCell(Text('quantity')),
          DataCell(Text('idInventory')),
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('name')),
          DataCell(Text('description')),
          DataCell(Text('quantity')),
          DataCell(Text('idInventory')),
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('name')),
          DataCell(Text('description')),
          DataCell(Text('quantity')),
          DataCell(Text('idInventory')),
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('name')),
          DataCell(Text('description')),
          DataCell(Text('quantity')),
          DataCell(Text('idInventory')),
        ]),
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('name')),
          DataCell(Text('description')),
          DataCell(Text('quantity')),
          DataCell(Text('idInventory')),
        ]),
      ],
    );
  }
}
