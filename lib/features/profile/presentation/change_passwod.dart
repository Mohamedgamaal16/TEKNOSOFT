import 'package:climb_up/features/profile/presentation/widgets/change_password_view_body.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ChangePasswordViewBody(),
        ),
      ),
    );
  }
}
