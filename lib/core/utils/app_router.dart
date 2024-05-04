import 'package:climb_up/core/widgets/bottom_nav_bar.dart';
import 'package:climb_up/features/auth/presention/sign_in_view.dart';
import 'package:climb_up/features/auth/presention/sign_up_view.dart';
import 'package:climb_up/features/profile/presentation/change_passwod.dart';

import 'package:climb_up/features/splash/presention/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLogInView = '/logIn';
  static const kSignUp = '/signUp';
  static const kHomeView = '/homeView';
  static const kBottomNavBar = '/bottomNavBar';
  static const kChangePassword = '/changePassword';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
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
        path: kBottomNavBar,
        builder: (context, state) => const CustomBottomNavigationBar(),
      ),
      GoRoute(
        path: kChangePassword,
        builder: (context, state) => const ChangePasswordView(),
      ),
    ],
  );
}
