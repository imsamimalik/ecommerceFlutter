import 'package:dio/dio.dart';
import 'package:ecommerceflutter/utils/helper.dart';
import 'package:velocity_x/velocity_x.dart';

import '../store/store.dart';

class CONSTANTS {
  static const imgURL = 'http://127.0.0.1:8000/storage/';
  static const API_BASE_URL = 'http://127.0.0.1:8000/api';
  static var token = (VxState.store as MyStore).token;

  static var HEADERS = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };

  static final DIO = Dio(BaseOptions(baseUrl: API_BASE_URL, headers: HEADERS))
    ..interceptors.add(Logging());
}

class Logging extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (Helper.isTokenValid(err.response!.statusCode)) {
      return super.onError(err, handler);
    }
  }
}
