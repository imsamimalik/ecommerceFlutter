import 'package:ecommerceflutter/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../pages/product_detail.dart';
import '../../store/store.dart';
import '../../utils/constants.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [RemoveCart]);
    return cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetail(product: item)));
                  },
                  child: ListTile(
                    leading: Image.network(
                        '${CONSTANTS.imgURL}${item.imgUrl}',
                        fit: BoxFit.contain),
                    trailing: IconButton(
                        onPressed: () {
                          RemoveCart(item);
                        },
                        icon: const Icon(Icons.remove_circle_outline)),
                    title: item.name.text.make(),
                  ).p24(),
                ),
              );
            });
  }
}
