import 'package:climb_up/features/auth/presention/views/sign_in_view.dart';
import 'package:climb_up/features/auth/presention/views/sign_up_view.dart';
import 'package:climb_up/features/home/presention/view_models/home_cubit/home_cubit.dart';
import 'package:climb_up/features/home/presention/views/home_view.dart';
import 'package:climb_up/features/profile/presentation/views/change_passwod.dart';
import 'package:climb_up/features/splash/presention/view_models/splash_cubit/splash_cubit.dart';
import 'package:climb_up/features/splash/presention/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kLogInView = '/logIn';
  static const kSignUp = '/signUp';
  static const kHomeView = '/homeView';
  static const kChangePassword = '/changePassword';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: kSplashView,
      builder: (context, state) => BlocProvider(
        create: (context) => SplashCubit(),
        child: const SplashView(),
      ),
    ),
    GoRoute(
      path: kLogInView,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: kSignUp,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit(),
        child: const HomeView(),
      ),
    ),
    GoRoute(
      path: kChangePassword,
      builder: (context, state) => const ChangePasswordView(),
    ),
  ]);
}
