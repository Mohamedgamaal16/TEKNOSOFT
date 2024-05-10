import 'package:climb_up/core/utils/app_router.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/utils/service_locator.dart';
import 'package:climb_up/features/profile/data/models/profile_model.dart';
import 'package:climb_up/features/profile/data/repos/profile_repo.dart';
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
    if (context.mounted) {
      GoRouter.of(context).pushReplacement(AppRouter.kSplashView);
    }
  }
}
