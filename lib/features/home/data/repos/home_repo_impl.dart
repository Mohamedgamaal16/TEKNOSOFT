import 'package:climb_up/core/api/api_consumer.dart';
import 'package:climb_up/core/api/endpoint.dart';
import 'package:climb_up/core/errors/exceptions.dart';
import 'package:climb_up/features/add_post/data/models/product_model.dart';
import 'package:climb_up/features/home/data/models/add_to_cart_model.dart';
import 'package:climb_up/features/home/data/models/product_model.dart';
import 'package:climb_up/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer api;

  HomeRepoImpl({required this.api});
  @override
  void changePages(int currentIndex, int value) {
    currentIndex = value;
  }

  @override
  Future<Either<String, ProductDataModel>> fetchProducts() async {
    try {
      final response = await api.get(EndPoint.getAllProducts);
      final data = ProductDataModel.fromJson(response);
      print(data);
      return right(data);
    } on ServerException catch (e) {
      return left(e.errModel.message);
    }
  }

  @override
  Future<Either<String, String>> addProductToCart(
      {required String productId}) async {
    try {
      final response = await api.post(EndPoint.addToCart(productId));

      final data = AddToCartResponse.fromJson(response);

      return right(data.message);
    } on ServerException catch (e) {
      return left(e.errModel.message);
    }
  }
}
