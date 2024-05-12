import 'package:bloc/bloc.dart';
import 'package:climb_up/features/profile/data/models/user_model.dart';
import 'package:climb_up/features/profile/data/repos/profile_repo.dart';
import 'package:meta/meta.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit(this.profileRepo) : super(GetUserDataInitial());
  final ProfileRepo profileRepo;
  fetchUserData() async {
    final user = await profileRepo.fetchUserData();
    user.fold((err) => emit(GetUserDataFaliure(errMessage: err)),
        (success) => emit(GetUserDataSuccess(userModel: success)));
  }
 
  
}
