import 'package:bases2/features/cataloge/data/datasource/remote/catalogue_api.dart';
import 'package:bases2/features/cataloge/data/repositories/catalogue_repository_impl.dart';
import 'package:bases2/features/cataloge/domain/entities/product.dart';
import 'package:bases2/features/cataloge/domain/repositories/repository_catalogue.dart';
import 'package:get/get.dart';

class CatalogueViewModel extends GetxController {
  final CatalogueRepository repository =
      CatalogueRepositoryImpl(catalogueApi: CatalogueApi());

  RxMap<dynamic, dynamic> catalogue = <dynamic, dynamic>{}.obs;
  RxList<Producto> products = <Producto>[].obs;
  RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() async {
    await getProducts();
    await initialCatalogue();
    super.onInit();
  }

  Future<void> getProducts() async {
    final result = await repository.getCatalogue();
    result.fold(
      (left) => Get.snackbar('Error', left.toString()),
      (rigth) {
        products.addAll(rigth);
      },
    );
  }

  Future<void> initialCatalogue() async {
    //
    for (var element in products) {
      catalogue.putIfAbsent(element.idProducto, () => 0);
    }
  }

  void addProduct(dynamic id, bool isAdd) {
    totalPrice.value = 0.0;
    catalogue.update(
      id,
      (value) => isAdd ? value + 1 : (value > 0 ? value - 1 : 0),
    );

    for (var element in products) {
      totalPrice.value +=
          int.parse(element.precio) * catalogue[element.idProducto];
    }
  }

  Future<void> buyProducts() async {
    //   final json= catalogue.entries.map((e) => {
    //     'idProducto': e.key,
    //     'cantidad': e.value,
    //   }).toList();

    // final result = await repository.buyProducts(json);
    // result.fold(
    //   (left) => Get.snackbar('Error', left.toString()),
    //   (rigth) {
    //     Get.snackbar('Compra exitosa', 'Compra realizada con exito');
    //     catalogue.clear();
    //     totalPrice.value = 0.0;
    //   },
    // );
  }
  static CatalogueViewModel get finOrInitialized {
    try {
      return Get.find();
    } catch (e) {
      return Get.put(CatalogueViewModel());
    }
  }
}
