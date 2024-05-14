import 'package:climb_up/features/profile/data/models/profile_model.dart';
import 'package:climb_up/features/profile/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class ProfileRepo {
  // Future loadData(
  //   int genderIndex,
  //   ProfileModel profileModel,
  //   List<String> genders,
  // );

  Future changeGender(
    int genderIndex,
    ProfileModel profileModel,
    List<String> genders,
  );
  Future logOut(BuildContext context);

  Future<Either<String, UserModel>> fetchUserData();
  Future<Either<String, String>> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword});
}
