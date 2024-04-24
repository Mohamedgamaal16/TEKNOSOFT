import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/features/signup/presention/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'back',
          style: AppStyles.poppinsStyleMedium16(context),
        ),
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.kPrimaryColor,
            )),
      ),
      body: const SafeArea(child: SingleChildScrollView(child: SignUpViewBody())),
    );
  }
}
