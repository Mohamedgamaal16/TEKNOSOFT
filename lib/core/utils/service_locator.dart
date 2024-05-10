import 'package:climb_up/core/api/dio_consumer.dart';
import 'package:climb_up/features/cart/data/repos/cart_repo_imp.dart';
import 'package:climb_up/features/home/data/repos/home_repo_impl.dart';
import 'package:climb_up/features/profile/data/repos/profile_repo_impl.dart';
import 'package:climb_up/features/splash/data/repos/splash_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future registerInstances() async {
  getIt.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
  getIt.registerSingleton(
    DioConsumer(
      dio: Dio(),
    ),
  );

  getIt.registerSingleton(CartRepoImp(api: getIt.get<DioConsumer>()));
  getIt.registerSingleton(SplashRepoImpl());
  getIt.registerSingleton(HomeRepoImpl());
  getIt.registerSingleton(ProfileRepoImpl());
}
  // static final prefs = getIt.getAsync<SharedPreferences>();
  // static final splashRepoImpl = getIt.get<SplashRepoImpl>();
  // static final homeRepoImpl = getIt.get<HomeRepoImpl>();
  // static final profileRepoImpl = getIt.get<ProfileRepoImpl>();
