
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'helper.dart';
class myDio {

  static final dio =
      Dio(
    BaseOptions(
      baseUrl: constants.API_BASE_URL,
    ),
  )
        ..interceptors.add(Logging());
}

class Logging extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    bool isLoggedIn = await Helper.isTokenValid(err.response!.statusCode);
    if (isLoggedIn) {
      print('Error code => ${err.response!.statusCode}');
      return super.onError(err, handler);
    }
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");

    options.headers.addAll({"Authorization": "Bearer $token"});
    return super.onRequest(options, handler);
  }

}
