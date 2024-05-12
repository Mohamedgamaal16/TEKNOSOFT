import 'package:climb_up/features/home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  void changePages(int currentIndex, int value);

  Future<Either<String, ProductDataModel>> fetchProducts();
    Future<Either<String, String>> addProductToCart({required String productId});

}
