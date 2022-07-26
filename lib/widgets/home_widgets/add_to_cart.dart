import '../../models/Item.dart';
import '../../models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../store/store.dart';

class AddToCart extends StatelessWidget {
  final Item item;
  const AddToCart({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    bool isInCart = cart.items.contains(item);
    VxState.watch(context, on: [AddCart, RemoveCart]);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddCart(item);
        } else {
          RemoveCart(item);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            context.theme.floatingActionButtonTheme.backgroundColor),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
      child: isInCart
          ? const Icon(
              Icons.done,
              color: Colors.white,
            )
          : const Icon(
              CupertinoIcons.cart_badge_plus,
              color: Colors.white,
            ),
    );
  }
}
