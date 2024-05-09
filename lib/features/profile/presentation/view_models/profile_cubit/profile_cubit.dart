import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/utils/service_locator.dart';
import 'package:climb_up/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  late ProfileModel profileModel;
  final List<String> genders = [
    'Male',
    'Female',
  ];
  late int genderIndex;
  Future loadData() async {
    emit(ProfileIsLoading());
    final SharedPreferences prefs = await GetInstance.prefs;
    genderIndex = prefs.getInt(SharedPrefKeys.kProfileGenderIndex) ?? 0;
    await Future(
      () => profileModel = ProfileModel(
        name: prefs.getString(SharedPrefKeys.kProfileName) ?? '',
        userName: prefs.getString(SharedPrefKeys.kProfileUserName) ?? '@',
        email: prefs.getString(SharedPrefKeys.kProfileEmail) ?? '',
        phone: prefs.getString(SharedPrefKeys.kProfilePhone) ?? '',
        imageLink: prefs.getString(SharedPrefKeys.kProfileImageLink) ?? '',
        password: prefs.getString(SharedPrefKeys.kProfilePasswrod) ?? '',
        gender: genders[genderIndex],
      ),
    );

    emit(ProfileLoadedSuccessfully());
  }

  // Gender Section

  Future setGender(int genderIndex) async {
    final SharedPreferences prefs = await GetInstance.prefs;
    prefs.setInt(SharedPrefKeys.kProfileGenderIndex, genderIndex);
    profileModel.gender = genders[genderIndex];
    emit(SetGender());
  }

}
