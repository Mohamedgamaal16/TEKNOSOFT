import 'package:climb_up/core/api/dio_consumer.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/features/profile/data/repos/profile_repo_impl.dart';
import 'package:climb_up/features/profile/presentation/view_models/change_password_cubit/change_password_cubit.dart';
import 'package:climb_up/features/profile/presentation/views/widgets/change_password_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.kPrimaryColor,
        title: const Text('Back'),
      ),
      body:  SafeArea(
        child: BlocProvider(
          create: (context) => ChangePasswordCubit(ProfileRepoImpl(api: DioConsumer(dio: Dio()))),
          child: const ChangePasswordViewBody(),
        ),
      ),
    );
  }
}
