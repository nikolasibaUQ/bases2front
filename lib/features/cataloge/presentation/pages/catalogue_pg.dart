import 'package:bases2/features/cataloge/presentation/view_model/catalogue_vm.dart';
import 'package:bases2/shared/colors/colors.dart';
import 'package:bases2/shared/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final controller = CatalogueViewModel.finOrInitialized;

    return Obx(() => Column(
          children: [
            Text(
              'Catalogo de productos disponibles',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: responsive.fpw(25),
                  fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(responsive.dp(1)),
              height: responsive.hp(80),
              width: responsive.wp(95),
              child: GridView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 10,
                ),
                itemCount: controller.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = controller.products[index];
                  return _productCard(responsive, controller, product);
                },
              ),
            ),
            SizedBox(
              width: responsive.wp(95),
              height: responsive.hp(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total a pagar: \$ ${controller.totalPrice}',
                    style: TextStyle(
                        color: MyColors.primary,
                        fontSize: responsive.fpw(25),
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primary,
                      minimumSize: Size(responsive.wp(30), responsive.hp(8)),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Comprar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: responsive.fpw(25),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

_productCard(responsive, controller, product) {
  return Card(
    child: Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: Icon(Icons.image,
                      size: responsive.dp(5), color: MyColors.darkGray),
                ),
                Text(
                  product.idProducto.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: MyColors.violetBlue,
                      fontSize: responsive.fpw(18),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  product.nombre,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: MyColors.violetBlue,
                      fontSize: responsive.fpw(16),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  product.descripcion,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: MyColors.violetBlue,
                      fontSize: responsive.fpw(16),
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '\$ ${product.precio}',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: responsive.fpw(16),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(right: responsive.wp(1), left: responsive.wp(1)),
          height: responsive.hp(5),
          width: responsive.wp(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: MyColors.violetBlue),
          ),
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () =>
                      controller.addProduct(product.idProducto, true)),
              VerticalDivider(
                color: MyColors.violetBlue,
                thickness: 1,
              ),
              Obx(() => Expanded(
                    child: Center(
                        child: Text(controller.catalogue[product.idProducto]
                            .toString())),
                  )),
              VerticalDivider(
                color: MyColors.violetBlue,
                thickness: 1,
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () =>
                    controller.addProduct(product.idProducto, false),
              ),
            ],
          ),
        ),
        SizedBox(height: responsive.hp(1)),
      ],
    ),
  );
}
