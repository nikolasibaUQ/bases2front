import 'package:bases2/features/auth/data/datasources/local/local_auth.dart';
import 'package:bases2/features/auth/data/datasources/remote/auth_api.dart';
import 'package:bases2/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bases2/features/auth/domain/repositories/auth_repository.dart';
import 'package:bases2/features/cataloge/data/datasource/remote/catalogue_api.dart';
import 'package:bases2/features/cataloge/data/repositories/catalogue_repository_impl.dart';
import 'package:bases2/features/cataloge/domain/entities/product.dart';
import 'package:bases2/features/cataloge/domain/repositories/repository_catalogue.dart';
import 'package:get/get.dart';

class CatalogueViewModel extends GetxController {
  final CatalogueRepository repository =
      CatalogueRepositoryImpl(catalogueApi: CatalogueApi());
  final AuthRepository _authRepository =
      AuthRepositoryImpl(authApi: AuthApi(), localAuth: LocalAuth());

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
          double.parse(element.precio) * catalogue[element.idProducto];
    }
  }

  Future<void> buyProducts() async {
    final user = await _authRepository.getUserData();
    final List<Map<String, dynamic>> listProducts = <Map<String, dynamic>>[];
    for (var element in catalogue.keys) {
      if (catalogue[element] > 0) {
        listProducts.add({
          'idProducto': element,
          'cantidad': catalogue[element],
        });
      }
    }
    if (listProducts.isEmpty) {
      Get.snackbar('Error', 'No hay productos seleccionados');
      return;
    }

    final json = {
      'fechaVenta': DateTime.now().toString().substring(0, 10),
      'valor': totalPrice.value,
      'idAfiliado': user!.id,
      'listaProductos': listProducts,
    };

    final result = await repository.buyProducts(
      json: json,
    );

    result.fold(
      (left) => Get.snackbar('Error', left.toString()),
      (rigth) {
        Get.snackbar('Compra Exitosa', rigth.toString());
        catalogue.clear();
        totalPrice.value = 0.0;
        initialCatalogue();
      },
    );
  }

  static CatalogueViewModel get finOrInitialized {
    try {
      return Get.find();
    } catch (e) {
      return Get.put(CatalogueViewModel());
    }
  }
}
