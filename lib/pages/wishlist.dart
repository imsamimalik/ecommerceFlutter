import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/wishlist_widgets/wish_list.dart';


class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Wishlist'.text.makeCentered(),
      ),
      body: Column(
        children: [
          const WishlistList().p32().expand(),
          
        ],
      ),
      bottomNavigationBar: const BottomNav(
        currentIndex: 2,
      ),
    );
  }
}
