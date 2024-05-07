import 'dart:developer';

import 'package:climb_up/core/utils/app_router.dart';
import 'package:climb_up/core/utils/constants.dart';
import 'package:climb_up/core/utils/service_locator.dart';
import 'package:climb_up/features/splash/presention/views/widgets/app_logo.dart';
import 'package:climb_up/features/splash/presention/views/widgets/auth_options.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _animationControllerLTR;
  late Animation<Offset> _slidingAnimationLTR;
  late AnimationController _animationControllerRTL;
  late Animation<Offset> _slidingAnimationRTL;
  bool _isVisible = false;
  bool _isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    _initSlidingAnimationLTR();
    _initSlidingAnimationRTL();
    _loadData();
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        setState(
          () {
            _isVisible = !_isVisible;

            if (_isLoggedIn) {
              Future.delayed(
                const Duration(
                  seconds: 2,
                ),
                () => GoRouter.of(context).pushReplacement(AppRouter.kHomeView),
              );
            } else {
              _animationControllerLTR.forward();
              _animationControllerRTL.forward();
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationControllerLTR.dispose();
    _animationControllerRTL.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppLogo(isVisible: _isVisible),
        _isLoggedIn
            ? const SizedBox()
            : AuthOptions(
                slidingAnimationLTR: _slidingAnimationLTR,
                slidingAnimationRTL: _slidingAnimationRTL,
              ),
      ],
    );
  }

  void _initSlidingAnimationLTR() {
    _animationControllerLTR = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _slidingAnimationLTR = Tween<Offset>(
      begin: const Offset(-3, 0),
      end: Offset.zero,
    ).animate(_animationControllerLTR);
  }

  void _initSlidingAnimationRTL() {
    _animationControllerRTL = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _slidingAnimationRTL = Tween<Offset>(
      begin: const Offset(3, 0),
      end: Offset.zero,
    ).animate(_animationControllerRTL);
  }

  Future _loadData() async {
    final prefs = await GetInstance.prefs;
    _isLoggedIn = prefs.getBool(SharedPrefKeys.kSplashIsLoggedIn) ?? false;
    prefs.setBool(SharedPrefKeys.kSplashIsLoggedIn, _isLoggedIn);
  }
}
