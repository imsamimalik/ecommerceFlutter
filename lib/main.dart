import 'package:ecommerceflutter/models/User.dart';
import 'package:ecommerceflutter/pages/cart.dart';
import 'package:ecommerceflutter/pages/home.dart';
import 'package:ecommerceflutter/pages/login.dart';
import 'package:ecommerceflutter/pages/profile.dart';
import 'package:ecommerceflutter/pages/register.dart';
import 'package:ecommerceflutter/store/store.dart';
import 'package:ecommerceflutter/utils/routes.dart';
import 'package:ecommerceflutter/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'pages/wishlist.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(VxState(store: MyStore(), child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var token = (VxState.store as MyStore).token;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [LoginUser, LogoutUser]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        initialRoute: token != '' ? MyRoutes.home : MyRoutes.login,
        routes: {
          MyRoutes.home: (context) => const HomePage(),
          MyRoutes.login: (context) => const LoginPage(),
          MyRoutes.cart: (context) => const CartPage(),
          MyRoutes.profile: (context) => const ProfilePage(),
          MyRoutes.register: (context) => const RegisterPage(),
          MyRoutes.wishlist: (context) => const WishlistPage(),
        });
  }
}
