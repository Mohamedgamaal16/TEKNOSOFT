// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:climb_up/core/api/endpoint.dart';
import 'package:climb_up/core/errors/exceptions.dart';
import 'package:climb_up/core/function/upload_image_to_api.dart';
import 'package:climb_up/features/add_post/data/models/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:climb_up/core/api/api_consumer.dart';
import 'package:climb_up/features/add_post/data/repo/add_product_repo.dart';

class AddProductRepoImp implements AddproductRepo {
  ApiConsumer api;
  AddProductRepoImp({
    required this.api,
  });
  static String imagePath =
      '/data/user/0/com.example.climb_up/cache/71a0ffe1-dcb5-47c7-aad5-0e4c5992cba6/IMG_20240514_164904.jpg';

  @override
  Future<Either<String, String>> addProduct(
      XFile? pic2, XFile? pic3, XFile? pic4,
      {required String name,
      required String price,
      required String description,
      required XFile pic}) async {
    // MultipartFile photoFiles = await uploadImageToAPI(pic);
    String fileName = pic.path.split('/').last;

    try {
      final response = await api.post(
        EndPoint.addProduct,
        isFormData: true,
        data: {
          "name": name,
          "price_egp": price,
          "description": description,
          "photos":
           await uploadImageToAPI(pic),

          //      await MultipartFile.fromFile(
          //   pic.path,
          //   filename: fileName,
          // ),
          // await MultipartFile.fromFile(imagePath, filename: 'photos.jpg')

          // [
          // await uploadImageToAPI(pic),
          // if (pic2 != null) await uploadImageToAPI(pic2),
          // if (pic3 != null) await uploadImageToAPI(pic3),
          // if (pic4 != null) await uploadImageToAPI(pic4),
          // ],
        },
      );
      final data = AddProductModel.fromJson(response);
      return right(data.status);
    } on ServerException catch (e) {
      return left(e.errModel.message);
    }
  }
}
