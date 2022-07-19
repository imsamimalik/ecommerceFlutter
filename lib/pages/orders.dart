import 'package:ecommerceflutter/widgets/orders_widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../store/store.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    var orders = (VxState.store as MyStore).orders;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Recent Orders'.text.make(),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            orders.isEmpty
                ? "Nothing to show".text.xl3.makeCentered()
                : const OrdersList(),
          ],
        ).p32(),
      )),
    );
  }
}
