import 'package:climb_up/core/utils/app_router.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({
    super.key,
    required Animation<Offset> slidingAnimationLTR,
    required Animation<Offset> slidingAnimationRTL,
  })  : _slidingAnimationLTR = slidingAnimationLTR,
        _slidingAnimationRTL = slidingAnimationRTL;

  final Animation<Offset> _slidingAnimationLTR;
  final Animation<Offset> _slidingAnimationRTL;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SlideTransition(
          position: _slidingAnimationLTR,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .45,
            child: CustomButton(
              textColor: Colors.white,
              onPressed: () {
                GoRouter.of(context)
                    .push(AppRouter.kLogInView); // Use replace instead of push
              },
              haveBorder: true,
              color: AppColors.kPrimaryColor,
              labelName: 'Log in',
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SlideTransition(
          position: _slidingAnimationRTL,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .45,
            child: CustomButton(
              textColor: AppColors.kPrimaryColor,
              onPressed: () {
                GoRouter.of(context)
                    .push(AppRouter.kSignUp); // Use replace instead of push
              },
              color: Colors.white,
              labelName: 'Sign Up',
            ),
          ),
        ),
      ],
    );
  }
}
