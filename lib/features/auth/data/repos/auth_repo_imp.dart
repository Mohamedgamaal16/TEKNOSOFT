import 'package:climb_up/core/api/endpoint.dart';
import 'package:climb_up/core/cache/cahche_helper.dart';
import 'package:climb_up/core/errors/exceptions.dart';
import 'package:climb_up/core/utils/service_locator.dart';
import 'package:climb_up/features/auth/data/model/auth_model.dart';
import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:climb_up/core/api/api_consumer.dart';
import 'package:climb_up/features/auth/data/repos/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoImp implements AuthRepo {
  ApiConsumer api;
  AuthRepoImp({
    required this.api,
  });
  @override
  Future<Either<AuthResponseModel, String>> signUp(
      {required String email,
      required String password,
      required String confirmPassword,
      required String userName}) async {
    try {
      final response = await api.post(EndPoint.signUp, data: {
        ApiKey.email: email,
        ApiKey.password: password,
        ApiKey.passwordConfirm: confirmPassword,
        ApiKey.name: userName
      });
      final data = AuthResponseModel.fromJson(response);
      final decodeToken = JwtDecoder.decode(data.token);
      // CacheHelper().saveData(key: "token", value: data.token);
      // CacheHelper().saveData(key: "id", value: decodeToken[ApiKey.id]);
      // CacheHelper.sharedPreferences
      //     .setString(ApiKey.token, data.token);

      final SharedPreferences prefs = await getIt.getAsync<SharedPreferences>();
      prefs.setString(ApiKey.token, data.token);
      prefs.setString(ApiKey.id, decodeToken[ApiKey.id]);

      return left(data);
    } on ServerException catch (e) {
      return right(e.errModel.message);
    }
  }

  @override
  Future<Either<AuthResponseModel, String>> signIn(
      {required String email, required String password}) async {
    try {
      final response = await api.post(EndPoint.login, data: {
        ApiKey.email: email,
        ApiKey.password: password,
      });
      final data = AuthResponseModel.fromJson(response);
      final decodeToken = JwtDecoder.decode(data.token);

      final SharedPreferences prefs = await getIt.getAsync<SharedPreferences>();
      prefs.setString(ApiKey.token, data.token);
      prefs.setString(ApiKey.id, decodeToken[ApiKey.id]);
      
      return left(data);
    } on ServerException catch (e) {
      return right(e.errModel.message);
    }
  }
}
