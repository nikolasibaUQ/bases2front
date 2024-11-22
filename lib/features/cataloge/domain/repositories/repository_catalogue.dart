import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/cataloge/domain/entities/product.dart';

abstract class CatalogueRepository {
  Future<Either<Exception, List<Producto>>> getCatalogue();
  Future<Either<Exception, dynamic>> buyProducts({required Map json});
}
