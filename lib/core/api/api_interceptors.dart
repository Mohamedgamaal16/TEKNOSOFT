import 'package:climb_up/core/api/endpoint.dart';
import 'package:climb_up/core/cache/cahche_helper.dart';
import 'package:climb_up/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final SharedPreferences prefs = await getIt.getAsync<SharedPreferences>();
    options.headers['Authorization'] = prefs.getString(ApiKey.token) != null
        ? 'Bearer ${prefs.getString(ApiKey.token)}'
        : null;

    super.onRequest(options, handler);
  }
}
