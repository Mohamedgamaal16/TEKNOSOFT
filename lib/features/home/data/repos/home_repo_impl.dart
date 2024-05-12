import 'package:climb_up/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  void changePages(int currentIndex, int value) {
    currentIndex = value;
  }

  @override
  Future<Either<String, dynamic>> addProductToCart() {
    // TODO: implement addProductToCart
    throw UnimplementedError();
  }

  @override
  Future<Either<String, dynamic>> fetchProducts() {
    // TODO: implement fetchProducts
    throw UnimplementedError();
  }
}
