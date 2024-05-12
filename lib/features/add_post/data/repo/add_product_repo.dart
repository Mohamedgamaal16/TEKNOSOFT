
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddproductRepo{
   Future<Either<String, String>> addProduct(
      {required String name,
      required String price,
      required String descrption,
      required XFile pic});
}
