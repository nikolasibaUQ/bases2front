import 'package:bases2/features/inventories/domain/entities/inventory.dart';
import 'package:bases2/features/inventories/view_model/inventories_vm.dart';
import 'package:bases2/shared/colors/colors.dart';
import 'package:bases2/shared/utils/responsive.dart';
import 'package:bases2/shared/widgets/custom_alert_forms.dart';
import 'package:bases2/shared/widgets/custom_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class InventoriesPage extends StatelessWidget {
  const InventoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final controller = InventoriesViewModel.findOrInitial;
    return Column(
      children: [
        SizedBox(height: responsive.hp(3)),
        Text('Inventarios',
            style: TextStyle(
                fontSize: responsive.fpw(20), color: MyColors.primary)),
        SizedBox(height: responsive.hp(4)),
        const DataTableInventorie(),
        SizedBox(height: responsive.hp(4)),
        ElevatedButton(
          onPressed: () {
            controller.clearControllers();
            CustomAlertForms(
                onAccept: () => controller.createNewProduct(),
                context: context,
                title: 'Agregar producto',
                forms: const FormsContetn());
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(
            'Agregar producto',
            style: TextStyle(color: MyColors.white),
          ),
        ),
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
        border: TableBorder.all(
            borderRadius: BorderRadius.circular(20),
            color: MyColors.primary,
            width: 1.5),
        columns: const [
          DataColumn(label: Text('Eliminar')),
          DataColumn(label: Text('Editar')),
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Nombre')),
          DataColumn(label: Text('Descripción')),
          DataColumn(label: Text('Cantidad')),
        ],
        rows: controller.inventories.map((inventory) {
          return DataRow(cells: [
            DataCell(IconButton(
                onPressed: () {
                  CustomConfirmationDialog(
                    context: context,
                    title: 'Esta seguro de eliminar el producto?',
                    subtitle: 'Esta acción no se puede deshacer',
                    onAccept: () => controller.deleteInventory(inventory),
                  );
                },
                icon: const Icon(Icons.delete))),
            DataCell(IconButton(
                onPressed: () {
                  controller.setControllersData(inventory);
                  CustomAlertForms(
                      onAccept: () async => await controller.updateProduct(),
                      context: context,
                      title: 'Editar producto',
                      forms: FormsContetn(
                        inventory: inventory,
                      ));
                },
                icon: const Icon(Icons.edit))),
            DataCell(Text(inventory.idProducto.toString())),
            DataCell(Text(inventory.nombre)),
            DataCell(Text(inventory.descripcion)),
            DataCell(Text(inventory.cantidad.toString())),
          ]);
        }).toList()));
  }
}

class FormsContetn extends StatelessWidget {
  const FormsContetn({super.key, this.inventory});

  final Inventory? inventory;

  @override
  Widget build(BuildContext context) {
    final controller = InventoriesViewModel.findOrInitial;

    final responsive = Responsive(context);

    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          if (inventory == null)
            Container(
              width: responsive.wp(70),
              margin: EdgeInsets.only(top: responsive.hp(2)),
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
              child: TextField(
                controller: controller.idProductController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: 'SKU del producto',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          Container(
            width: responsive.wp(70),
            margin: EdgeInsets.only(top: responsive.hp(2)),
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
            child: TextField(
              controller: controller.productNameController,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Nombre del Producto',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            width: responsive.wp(70),
            margin: EdgeInsets.only(top: responsive.hp(2)),
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
            child: TextField(
              controller: controller.productDescriptionController,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Descripcion del producto',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.violetBlue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            width: responsive.wp(70),
            margin: EdgeInsets.only(top: responsive.hp(2)),
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
            child: TextField(
              controller: controller.productPriceController,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Precio',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            width: responsive.wp(70),
            margin: EdgeInsets.only(top: responsive.hp(2)),
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
            child: TextField(
              controller: controller.productQuantityController,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Cantidad',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.violetBlue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
