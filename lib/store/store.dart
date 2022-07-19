import 'dart:convert';

import 'package:get/get_connect/http/src/utils/utils.dart';

import '../models/Item.dart';
import '../models/cart.dart';
import '../models/wishlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/User.dart';
import '../models/orders.dart';
import '../models/wishlist_item.dart';
import '../utils/lib.dart';

class MyStore extends VxStore {
  late ProductsModel products;
  late CartModel cart;
  late String token;
  late User user;
  late WishlistModel wishlist;
  late List<Orders> orders;

  MyStore() {
    products = ProductsModel();
    cart = CartModel();
    cart.products = products;
    wishlist = WishlistModel([]);
    orders = <Orders>[];
    initUser();
  }
  
  clearCart() {
    cart.clearCart();
  }
  clearOrder() {
    orders.clear();
  }

setToken(String token) {
    this.token = token;
  }

  clearToken() {
    token = '';
  }


  initUser() async {
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
    // print(user);
    if (token != '') {
      initWishlist();
      initOrders();
    }
  }

  initWishlist() async {
    final response = await myDio.dio.post('/wishlist');

    wishlist = WishlistModel(
      List.from(response.data)
          .map<WishlistItem>((item) => WishlistItem.fromMap(item))
          .toList(),
    );
  }

  initOrders() async {
    final response = await myDio.dio.get('/orders');
    orders = <Orders>[];
    response.data.forEach((v) {
      orders.add(Orders.fromAPI(v));
    });
  }

 
}
