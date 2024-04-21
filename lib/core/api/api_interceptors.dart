import 'package:climb_up/core/api/endpoint.dart';
import 'package:climb_up/core/cache/cahche_helper.dart';
import 'package:dio/dio.dart';


class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[RegestrionApiKey.token] =
        CacheHelper().getData(key: RegestrionApiKey.token) != null
            ? 'FOODAPI ${CacheHelper().getData(key: RegestrionApiKey.token)}'
            : null;
    super.onRequest(options, handler);
  }
}
