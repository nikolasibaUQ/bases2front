import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/cataloge/data/datasource/remote/catalogue_api.dart';
import 'package:bases2/features/cataloge/domain/entities/product.dart';
import 'package:bases2/features/cataloge/domain/repositories/repository_catalogue.dart';

class CatalogueRepositoryImpl implements CatalogueRepository {
  CatalogueRepositoryImpl({
    required this.catalogueApi,
  });
  final CatalogueApi catalogueApi;

  @override
  Future<Either<Exception, List<Producto>>> getCatalogue() {
    return catalogueApi.getProducts();
  }

  @override
  Future<Either<Exception, dynamic>> buyProducts({required Map json}) {
    return catalogueApi.buyProducts(json: json);
  }
}
