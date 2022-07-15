import 'package:ecommerceflutter/models/Item.dart';
import 'package:ecommerceflutter/models/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/wishlist_item.dart';
import '../../pages/product_detail.dart';
import '../../store/store.dart';
import '../../utils/constants.dart';

class WishlistList extends StatefulWidget {
  const WishlistList({Key? key}) : super(key: key);

  @override
  State<WishlistList> createState() => _WishlistListState();
}

class _WishlistListState extends State<WishlistList> {
  var wishlist = (VxState.store as MyStore).wishlist;

  @override
  void initState() {
    super.initState();
    loadWishlistList();
  }

  loadWishlistList() async {
    final response = await CONSTANTS.DIO.post('/wishlist');

    wishlist = WishlistModel(List.from(response.data)
        .map<WishlistItem>((item) => WishlistItem.fromMap(item))
        .toList());
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final wishlist = (VxState.store as MyStore).wishlist;
    VxState.watch(context, on: [AddWishlist, RemoveWishlist]);
    return wishlist.ids.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: wishlist.ids.length,
            itemBuilder: (context, index) {
              final id = wishlist.ids[index].productId;
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
                    title: item.productName.text.make(),
                  ).p24(),
                ),
              );
            });
  }
}
