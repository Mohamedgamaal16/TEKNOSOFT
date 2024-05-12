import 'package:climb_up/features/add_post/data/models/product_model.dart';
import 'package:climb_up/features/auth/data/model/auth_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddproductRepo{
   Future<Either<String, String>> addProduct(
      {required String name,
      required String price,
      required String descrption,
      required XFile pic});
}
