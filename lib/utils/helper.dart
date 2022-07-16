import 'package:ecommerceflutter/utils/routes.dart';
import 'package:flutter/material.dart';

import '../main.dart' show navigatorKey, scaffoldKey;
import '../models/User.dart' show LogoutUser;

class Helper {
  static isTokenValid(status) async {
    if (status == 401) {
      LogoutUser();
      final ScaffoldMessengerState scaffoldId = scaffoldKey.currentState!;
      scaffoldId.showSnackBar(
        const SnackBar(
            content: Text("You've been logged out!"),
            elevation: 0,
            backgroundColor: Colors.teal),
      );
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          MyRoutes.login, (Route<dynamic> route) => false);
      return false;
    } else {
      return true;
    }
  }
}
