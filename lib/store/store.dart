import 'dart:convert';

import 'package:ecommerceflutter/models/Item.dart';
import 'package:ecommerceflutter/models/cart.dart';
import 'package:ecommerceflutter/models/wishlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/User.dart';

class MyStore extends VxStore {
  late ProductsModel products;
  late CartModel cart;
  late String token;
  late User user;
  late Wishlist wishlist;

  MyStore() {
    products = ProductsModel();
    cart = CartModel();
    cart.products = products;
    wishlist = Wishlist([]);
    getInit();
  }
  getInit() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var value = localStorage.getString('token');
    token = value ?? "";

    String userSaved = localStorage.getString('user') ?? "";
    if (userSaved.isEmpty) {
      user = User(
        id: -1,
        username: '',
        name: '',
        email: '',
        address: '',
        walletBalance: -1,
      );
    } else {
      user = User.fromMap(json.decode(userSaved));
    }
    print(user);
  }
}
