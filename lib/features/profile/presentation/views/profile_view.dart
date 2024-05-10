import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:climb_up/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileIsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kPrimaryColor,
                ),
              );
            } else {
              return const SingleChildScrollView(
                child: ProfileViewBody(),
              );
            }
          },
        ),
      ),
    );
  }
}
