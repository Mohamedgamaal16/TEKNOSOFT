
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddproductRepo{
   Future<Either<String, String>> addProduct(XFile? pic2,XFile? pic3,XFile? pic4,
      {required String name,
      required String price,
      required String description,
      required XFile pic});
}
