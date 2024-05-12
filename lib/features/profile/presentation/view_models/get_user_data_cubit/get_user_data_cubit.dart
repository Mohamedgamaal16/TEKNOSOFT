import 'package:bloc/bloc.dart';
import 'package:climb_up/core/utils/service_locator.dart';
import 'package:climb_up/features/profile/data/models/profile_model.dart';
import 'package:climb_up/features/profile/data/models/user_model.dart';
import 'package:climb_up/features/profile/data/repos/profile_repo.dart';
import 'package:climb_up/features/profile/data/repos/profile_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit(this.profileRepo) : super(GetUserDataInitial());
  final ProfileRepo profileRepo;

  // late ProfileModel profileModel;
  // final List<String> genders = [
  //   'Male',
  //   'Female',
  // ];
  // late int genderIndex;

  fetchUserData() async {
    emit(GetUserDataLoading());
    final user = await profileRepo.fetchUserData();
    user.fold((err) => emit(GetUserDataFaliure(errMessage: err)),
        (success) => emit(GetUserDataSuccess(userModel: success)));
  }


  // Future setGender(int genderIndex) async {
  //   await getIt
  //       .get<ProfileRepoImpl>()
  //       .changeGender(genderIndex, profileModel, genders);
  //   emit(SetGender());
  // }

  void logOut(BuildContext context) {
    getIt.get<ProfileRepoImpl>().logOut(context);
  }

  
}
