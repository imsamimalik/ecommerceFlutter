import 'package:ecommerceflutter/models/Item.dart';
import 'package:ecommerceflutter/models/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../pages/product_detail.dart';
import '../../store/store.dart';
import '../../utils/constants.dart';

class WishlistList extends StatelessWidget {
  const WishlistList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlist = (VxState.store as MyStore).wishlist;
    VxState.watch(context, on: [RemoveWishlist]);
    return wishlist.ids.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: wishlist.ids.length,
            itemBuilder: (context, index) {
              final id = wishlist.ids[index];
              Item item= ProductsModel.products.firstWhere((it)=>it.id == id);
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
                          RemoveWishlist(item.id);
                        },
                        icon: const Icon(Icons.remove_circle_outline)),
                    title: item.name.text.make(),
                  ).p24(),
                ),
              );
            });
  }
}
