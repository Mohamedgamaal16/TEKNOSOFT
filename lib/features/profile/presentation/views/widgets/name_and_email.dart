
import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/features/profile/presentation/view_models/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameAndEmail extends StatelessWidget {
  const NameAndEmail({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.userModel.data.user.name,
                style: AppStyles.interStyleBold12(context).copyWith(
                  fontSize: 14,
                ),
              ),
              Text(
                state.userModel.data.user.email,
                style: AppStyles.interStyleRegular12(context),
              )
            ],
          );
        } else if (state is GetUserDataLoading) {
          return const CircularProgressIndicator();
        } else {
          return const Text('Something Wrong');
        }
      },
    );
  }
}