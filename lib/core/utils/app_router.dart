import 'package:go_router/go_router.dart';


abstract class AppRouter {
  static const kLogInView = '/logIn';
  static const kSignUp = '/signUp';
  static const kHomeView = '/homeView';
  static const kSeeMoreView = '/SeeMoreView';
  static const kExpolreSingleItemDiplay = '/expolreSingleItemDiplay';
  static const kBottomNavBar = '/bottomNavBar';

  static final GoRouter router = GoRouter(routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const SplashView(),
    // ),
    // GoRoute(
    //   path: kLogInView,
    //   builder: (context, state) => const LogInView(),
    // ),
    // GoRoute(
    //   path: kSignUp,
    //   builder: (context, state) => const SignUpView(),
    // ),
    // GoRoute(
      // path: kBottomNavBar,
      // path: kHomeView,
      // builder: (context, state) => const CustomBottomNavigationBar(),
            // builder: (context, state) => const HomeView(),

    // ),
    
  ]);
}
