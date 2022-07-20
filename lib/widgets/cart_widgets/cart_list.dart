import '../../models/cart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                        '${constants.imgURL}${item.imgUrl}',
                        fit: BoxFit.contain),
                    trailing: IconButton(
                      onPressed: () {
                        RemoveCart(item);
                      },
                      icon: const Icon(FontAwesomeIcons.trashCan, size: 20),
                    ),
                    title: item.productName.text.make(),
                  ).p24().backgroundColor(Vx.teal50),
                ),
              );
            });
  }
}
