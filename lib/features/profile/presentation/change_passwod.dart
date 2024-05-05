import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/features/profile/presentation/widgets/change_password_view_body.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(foregroundColor: AppColors.kPrimaryColor,title: const Text('Back'),),
      body: const SafeArea(
        child: ChangePasswordViewBody(),
      ),
    );
  }
}
