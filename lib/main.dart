import 'package:ecommerceflutter/pages/home.dart';
import 'package:ecommerceflutter/pages/orders.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'models/User.dart';
import 'pages/cart.dart';
import 'pages/login.dart';
import 'pages/profile.dart';
import 'pages/register.dart';
import 'pages/success.dart';
import 'pages/wishlist.dart';
import 'store/store.dart';
import 'utils/routes.dart';
import 'utils/theme.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

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
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldKey,
        initialRoute: token != '' ? MyRoutes.home : MyRoutes.login,
        routes: {
          MyRoutes.home: (context) => const HomePage(),
          MyRoutes.login: (context) => const LoginPage(),
          MyRoutes.cart: (context) => const CartPage(),
          MyRoutes.profile: (context) => const ProfilePage(),
          MyRoutes.register: (context) => const RegisterPage(),
          MyRoutes.wishlist: (context) => const WishlistPage(),
          MyRoutes.success: (context) => const SuccessPage(),
          MyRoutes.orders: (context) => const OrdersPage(),
        });
  }
}
