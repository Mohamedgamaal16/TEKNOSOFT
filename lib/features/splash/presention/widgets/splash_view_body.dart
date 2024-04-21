import 'package:climb_up/core/utils/app_router.dart';
import 'package:climb_up/core/utils/app_styles.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late AnimationController animationController2;
  late Animation<Offset> slidingAnimation2;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    initSlidingAnimationhr();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    animationController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo.png'),
        const SizedBox(
          height: 45,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Everything you need for your brand is here',
            textAlign: TextAlign.center,
            style: AppStyles.poppinsStyleRegular14(context)
                .copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SlideTransition(
              position: slidingAnimation,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .45,
                child: CustomButton(
                  textColor: Colors.white,
                  onPressed: () {
                    GoRouter.of(context).replace(AppRouter.kLogInView); // Use replace instead of push
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
              position: slidingAnimation2,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .45,
                child: CustomButton(
                  textColor: AppColors.kPrimaryColor,
                  onPressed: () {
                    GoRouter.of(context).replace(AppRouter.kSignUp); // Use replace instead of push
                  },
                  color: Colors.white,
                  labelName: 'Sign Up',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(-3, 0),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void initSlidingAnimationhr() {
    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation2 = Tween<Offset>(
      begin: const Offset(3, 0),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
