// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:climb_up/core/api/endpoint.dart';
import 'package:climb_up/core/cache/cahche_helper.dart';
import 'package:climb_up/core/errors/exceptions.dart';
import 'package:climb_up/core/function/upload_image_to_api.dart';
import 'package:climb_up/features/add_post/data/models/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import 'package:climb_up/core/api/api_consumer.dart';
import 'package:climb_up/features/add_post/data/repo/add_product_repo.dart';

class AddProductRepoImp implements AddproductRepo {
  ApiConsumer api;
  AddProductRepoImp({
    required this.api,
  });
  @override
  Future<Either<String, String>> addProduct(
      {required String name,
      required String price,
      required String descrption,
      required XFile pic}) async {
    try {
      final response =
          await api.post(EndPoint.addProduct, isFormData: true, data: {
        ApiKey.name: name,
        ApiKey.priceEgp: price,
        ApiKey.evaluation: descrption,
        ApiKey.pic: await uploadImageToAPI(pic)
      }, );
      final data = ProductResponseModel.fromJson(response);
      return right(data.status);
    } on ServerException catch (e) {
      return left(e.errModel.message);
    }
  }
}
