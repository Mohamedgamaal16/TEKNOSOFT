import 'package:climb_up/features/profile/data/models/profile_model.dart';
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
}
