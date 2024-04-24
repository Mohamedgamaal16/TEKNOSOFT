import 'package:climb_up/core/widgets/bottom_nav_bar.dart';
import 'package:climb_up/features/signin/presention/sign_in_view.dart';
import 'package:climb_up/features/signup/presention/sign_up_view.dart';
import 'package:climb_up/features/splash/presention/splash_view.dart';
import 'package:go_router/go_router.dart';


abstract class AppRouter {
  static const kLogInView = '/logIn';
  static const kSignUp = '/signUp';
  static const kHomeView = '/homeView';
  static const kBottomNavBar = '/bottomNavBar';

  static final GoRouter router = GoRouter(routes: [
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
    
  ]);
}
