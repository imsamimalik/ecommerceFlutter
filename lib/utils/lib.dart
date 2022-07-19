import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';

import '../store/store.dart';
import 'constants.dart';
import 'helper.dart';

class myDio {
  static var token = (VxState.store as MyStore).token;

  static var HEADERS = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };

  static final dio =
      Dio(BaseOptions(baseUrl: constants.API_BASE_URL, headers: HEADERS))
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
}
