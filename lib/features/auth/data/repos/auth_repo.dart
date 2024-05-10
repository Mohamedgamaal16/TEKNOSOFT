import 'package:climb_up/features/auth/data/model/auth_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<AuthResponseModel, String>> signIn(
      {required String email,required String password});
  Future<Either<AuthResponseModel, String>> signUp(
      {required String email,
      required String password,
      required String confirmPassword,
      required String userName});
}
