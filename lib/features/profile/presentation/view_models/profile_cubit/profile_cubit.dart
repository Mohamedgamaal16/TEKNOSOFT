import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/utils/service_locator.dart';
import 'package:climb_up/features/profile/data/models/profile_model.dart';
import 'package:climb_up/features/profile/data/repos/profile_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  XFile? pic;

  late ProfileModel profileModel;
  final List<String> genders = [
    'Male',
    'Female',
  ];
  late int genderIndex;
  Future loadData() async {
    emit(
      ProfileIsLoading(),
    );
    final SharedPreferences prefs = await getIt.getAsync<SharedPreferences>();
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
    emit(
      ProfileLoadedSuccessfully(),
    );
  }

  Future setGender(int genderIndex) async {
    await getIt
        .get<ProfileRepoImpl>()
        .changeGender(genderIndex, profileModel, genders);
    emit(SetGender());
  }

  void logOut(BuildContext context) {
    getIt.get<ProfileRepoImpl>().logOut(context);
  }
  uploadProfilePic(XFile image) {
    pic = image;
    emit(UploadProfilePic());
  }
}
