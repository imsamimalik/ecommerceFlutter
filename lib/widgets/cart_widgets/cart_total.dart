import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/orders.dart';
import '../../store/store.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;


addOrder() {
      if (cart.items.isNotEmpty) {
        List<num> pid;
        pid = <num>[];
        for (var v in cart.items) {
          pid.add(v.id);
        }
        AddOrder(pid);
      }
    }


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
            onPressed: cart.items.isEmpty ? null : addOrder,
            style: ElevatedButton.styleFrom(
              primary: context.theme.floatingActionButtonTheme.backgroundColor,
              shape: const StadiumBorder(),
            ),
            child: 'Buy'.text.bold.color(context.theme.canvasColor).make(),
          ).wh(100, 50)
        ],
      ),
    );
  }
}
