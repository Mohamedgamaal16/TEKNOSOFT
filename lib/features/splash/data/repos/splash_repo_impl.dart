import 'package:climb_up/features/splash/data/repos/splash_repo.dart';
import 'package:flutter/material.dart';

class SplashRepoImpl implements SplashRepo {
  @override
  void initSlidingAnimationLRTL(
    AnimationController animationControllerRTL,
    Animation<Offset> slidingAnimationRTL,
    TickerProvider tickerProvider,
  ) {
    animationControllerRTL = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(seconds: 1),
    );
    slidingAnimationRTL = Tween<Offset>(
      begin: const Offset(3, 0),
      end: Offset.zero,
    ).animate(animationControllerRTL);
  }

  @override
  void initSlidingAnimationLTR(
    AnimationController animationControllerLTR,
    Animation<Offset> slidingAnimationLTR,
    TickerProvider tickerProvider,
  ) {
    animationControllerLTR = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(seconds: 1),
    );
    slidingAnimationLTR = Tween<Offset>(
      begin: const Offset(-3, 0),
      end: Offset.zero,
    ).animate(animationControllerLTR);
  }
}
