import 'package:climb_up/core/api/api_consumer.dart';
import 'package:climb_up/core/api/endpoint.dart';
import 'package:climb_up/core/errors/exceptions.dart';
import 'package:climb_up/core/utils/app_router.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/utils/service_locator.dart';
import 'package:climb_up/features/profile/data/models/change_pass_model.dart';
import 'package:climb_up/features/profile/data/models/profile_model.dart';
import 'package:climb_up/features/profile/data/models/user_model.dart';
import 'package:climb_up/features/profile/data/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepoImpl implements ProfileRepo {
  // @override
  // Future loadData(
  //   int genderIndex,
  //   ProfileModel profileModel,
  //   List<String> genders,
  // ) async {}
  final ApiConsumer api;

  ProfileRepoImpl({required this.api});
  @override
  Future changeGender(
    int genderIndex,
    ProfileModel profileModel,
    List<String> genders,
  ) async {
    final SharedPreferences prefs = await getIt.getAsync<SharedPreferences>();
    prefs.setInt(SharedPrefKeys.kProfileGenderIndex, genderIndex);
    profileModel.gender = genders[genderIndex];
  }

  @override
  Future logOut(BuildContext context) async {
    final SharedPreferences prefs = await getIt.getAsync<SharedPreferences>();
    prefs.setBool(SharedPrefKeys.kSplashIsLoggedIn, false);
    prefs.setString(SharedPrefKeys.kProfileName, 'null');
    prefs.setString(SharedPrefKeys.kProfileUserName, 'null');
    prefs.setString(SharedPrefKeys.kProfileEmail, 'null');
    prefs.setString(SharedPrefKeys.kProfilePhone, 'null');
    if (context.mounted) {
      GoRouter.of(context).pushReplacement(AppRouter.kSplashView);
    }
  }

  @override
  Future<Either<String, UserModel>> fetchUserData() async {
    final SharedPreferences prefs = await getIt.getAsync<SharedPreferences>();

    try {
      final response =
          await api.get(EndPoint.getUserData(prefs.getString(ApiKey.id)));
      final user = UserModel.fromJson(response);

      prefs.setString(SharedPrefKeys.kProfileName, user.data.user.name);
      prefs.setString(SharedPrefKeys.kProfileUserName, user.data.user.name);
      prefs.setString(SharedPrefKeys.kProfileEmail, user.data.user.email);
      prefs.setString(SharedPrefKeys.kProfilePhone, user.data.user.id);

      return Right(user);
    } catch (e) {
      return Left('Failed to fetch user data: $e');
    }
  }

  @override
  Future<Either<String, String>> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword}) async {
    try {
      final response = await api.patch(EndPoint.changePassword,data: {
        "oldPassword":oldPassword,
         "newPassword":newPassword,
         "passwordConfirm":confirmPassword,
      });

      ChangePasswordModel data = ChangePasswordModel.fromJson(response);
      return right(data.message);
    } on ServerException catch (e) {
      return left(e.errModel.message);
    }
  }
}
