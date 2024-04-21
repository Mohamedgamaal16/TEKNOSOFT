import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/features/splash/presention/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';



class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
      backgroundColor: AppColors.kPrimaryColor,
    );
  }
}
