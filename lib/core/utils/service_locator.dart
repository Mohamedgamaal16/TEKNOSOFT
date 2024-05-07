import 'package:climb_up/features/splash/data/repos/splash_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetInstance {
  static final getIt = GetIt.instance;

  static Future registerInstances() async {
    getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance(),
    );
    getIt.registerSingleton(SplashRepoImpl());
  }

  static final prefs = getIt.getAsync<SharedPreferences>();
  static final splashRepoImpl = getIt.get<SplashRepoImpl>();
  // static final authRepoImpl = getIt.get<AuthRepoImpl>();
  // static final homeRepoImpl = getIt.get<HomeRepoImpl>();
}
