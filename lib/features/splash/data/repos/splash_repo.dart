import 'package:flutter/material.dart';

abstract class SplashRepo {
  void initSlidingAnimationLTR(
    AnimationController animationControllerLTR,
    Animation<Offset> slidingAnimationLTR,
    TickerProvider tickerProvider,
  );
  void initSlidingAnimationLRTL(
    AnimationController animationControllerRTL,
    Animation<Offset> slidingAnimationRTL,
    TickerProvider tickerProvider,
  );
}
