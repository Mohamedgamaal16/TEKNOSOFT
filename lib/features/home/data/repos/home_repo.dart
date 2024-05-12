import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  void changePages(int currentIndex, int value);

  Future<Either<String, dynamic>> fetchProducts();
    Future<Either<String, dynamic>> addProductToCart();

}
