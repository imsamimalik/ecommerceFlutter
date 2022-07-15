import 'package:ecommerceflutter/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../store/store.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            builder: ((context, store, status) {
              return "\$${cart.totalPrice}"
                  .text
                  .xl4
                  .color(context.theme.textTheme.headline1!.color)
                  .make();
            }),
            mutations: const {RemoveCart},
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    context.theme.floatingActionButtonTheme.backgroundColor),
                shape: MaterialStateProperty.all(const StadiumBorder())),
            child: 'Buy'.text.make(),
          ).wh(100, 50)
        ],
      ),
    );
  }
}
