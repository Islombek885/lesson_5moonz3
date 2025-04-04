import 'package:lesson_5moonz3/controller/product_service.dart';
import 'package:lesson_5moonz3/models/product_model.dart';

class ProductController {
  final ProductService productServise = ProductService();

  Future<List<ProductModel>> toCategory() async {
    return await productServise.toCategory();
  }
}
