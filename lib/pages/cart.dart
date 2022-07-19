import '../widgets/cart_widgets/cart_list.dart';
import '../widgets/cart_widgets/cart_total.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/bottom_nav.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Cart'.text.makeCentered(),
      ),
      body: Column(
        children: [
          const CartList().p32().expand(),
          const Divider(),
          const CartTotal()
        ],
      ),
      bottomNavigationBar: const BottomNav(
        currentIndex: 1,
      ),
    );
  }
}
